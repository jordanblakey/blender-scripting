import os
import subprocess
import sys

from butils import get_root

__all__ = ["install"]


def install():
    print("make cycles module symlink here for type checking:")
    expr = "print(bpy.utils.script_paths()[0])"
    scripts_path = run_in_blender(expr)
    source_path = os.path.join(scripts_path, "addons_core", "cycles")
    symlink_path = os.path.join(get_root("butils"), "btyping", "cycles")
    create_symlink("butils.btyping.cycles", source_path, symlink_path)

    print("make butils module symlink so it's available to scripts:")
    source_path = get_root("butils")
    expr = "print(bpy.utils.script_path_user())"
    user_scripts_path = run_in_blender(expr)
    print(f"Debug: install: user_scripts_path from run_in_blender='{user_scripts_path}'")
    symlink_path = os.path.join(user_scripts_path, "modules", "butils")
    create_symlink("butils", source_path, symlink_path)

    print("make butils module symlink so it's available to scripts:")
    install_requirements()
    print("Installation process complete.")


def run_in_blender(expr):
    expr = f"import bpy;{expr}"
    command = [
        "blender",
        "--quiet",
        "--background",
        "--python-expr",
        expr
    ]
    try:
        # Using capture_output=True for cleaner stdout/stderr handling
        # text=True decodes output as utf-8
        # Set check=False to closely mimic original os.popen behavior for now
        # (os.popen doesn't raise an error, just returns empty output on command failure)
        result = subprocess.run(command, capture_output=True, text=True, check=False)
        if result.returncode != 0:
            # Optionally, print stderr for debugging if Blender command itself fails
            # print(f"Blender command '{' '.join(command)}' failed with error code {result.returncode}:\n{result.stderr}", file=sys.stderr)
            return "" # Mimic os.popen behavior of returning empty on error
        return result.stdout.strip()
    except FileNotFoundError:
        # Handle case where 'blender' executable is not found
        print("Error: 'blender' command not found in PATH. Please ensure Blender is installed and accessible.", file=sys.stderr)
        return ""
    except Exception as e:
        # Catch other potential errors during subprocess execution
        print(f"An error occurred while trying to run Blender: {e}", file=sys.stderr)
        return ""


def create_symlink(module_name, source_path, symlink_path):
    """Create a symlink for module by name, given source and symlink paths."""
    print(f"Attempting to create symlink for module: {module_name}")
    print(f"  Source path: {source_path}")
    print(f"  Symlink path: {symlink_path}")

    parent_dir = os.path.dirname(symlink_path)
    print(f"  Parent directory for symlink: {parent_dir}")

    if parent_dir:
        print(f"  Ensuring parent directory '{parent_dir}' exists...")
        try:
            os.makedirs(parent_dir, exist_ok=True)
        except Exception as e:
            print(f"  Error creating parent directory '{parent_dir}': {e}", file=sys.stderr)
            # If parent dir creation fails, it's unlikely symlink will succeed.
            # For now, let it proceed and symlink creation might fail.

    # Check if symlink_path already exists
    if os.path.islink(symlink_path):
        print(f"  Symlink '{symlink_path}' already exists.")
    elif os.path.exists(symlink_path):
        print(f"  Path '{symlink_path}' already exists but is not a symlink. Will not overwrite.")
    else:
        # Path does not exist, proceed with symlink creation
        if not os.path.exists(source_path):
            print(f"  Source path '{source_path}' does not exist. Cannot create symlink.")
        else:
            print(f"  Attempting os.symlink(src='{source_path}', dst='{symlink_path}')")
            try:
                os.symlink(source_path, symlink_path)
                # Verify after creation attempt
                if os.path.islink(symlink_path):
                    print("  Symlink creation successful (symlink confirmed).")
                elif os.path.exists(symlink_path): 
                    print("  Symlink creation resulted in a path, but it's not a symlink - check manually.")
                else:
                    print("  Symlink creation failed (symlink not found after creation attempt).")
            except Exception as e:
                print(f"  Symlink creation failed with error: {e}", file=sys.stderr)
    
    # check importing works (original logic)
    if module_name:
        validate_importable(module_name)


def validate_importable(module_name):
    """Validate `import` works for a module by name."""
    R, G, C = "\033[91m", "\033[92m", "\033[0m"
    try:
        result = run_in_blender(f"import {module_name};print({module_name})")
        if not result:
            raise ModuleNotFoundError
    except ModuleNotFoundError:
        print(f"{R}FAIL: `{module_name}` is not importable{C}\n")
        return False
    else:
        print(f"{G}SUCCESS: `{module_name}` is importable{C}\n")
        return True


def install_requirements():
    """Install requirements.txt in Blender user scripts, allowing imports."""
    requirements_file_path = os.path.join(get_root("blender-scripting"), "requirements.txt")
    
    # Check if requirements.txt exists
    if not os.path.exists(requirements_file_path):
        print(f"Warning: requirements.txt not found at {requirements_file_path}", file=sys.stderr)
        return

    try:
        with open(requirements_file_path, "r") as f:
            requirements = f.readlines()
    except IOError as e:
        print(f"Error reading requirements.txt: {e}", file=sys.stderr)
        return

    expr = "print(bpy.utils.script_path_user())"
    user_scripts_path = run_in_blender(expr)

    if not user_scripts_path:
        print("Error: Could not determine Blender user scripts path. Cannot install requirements.", file=sys.stderr)
        return

    for package_line in requirements:
        package = package_line.strip().split("==")[0] # Handle version pinning like 'package==version'
        if not package or package.startswith("#"): # Skip empty lines or comments
            continue
            
        install_path = os.path.join(user_scripts_path, "modules", package)
        
        # Using subprocess.run for pip install command
        cmd = [
            sys.executable, # Use the current Python interpreter for pip
            "-m", "pip", "install", package,
            "--target", install_path,
            "--upgrade"
        ]
        try:
            print(f"Installing {package} to {install_path}...")
            # Using capture_output=True, text=True for cleaner output
            # check=True will raise CalledProcessError if pip fails
            result = subprocess.run(cmd, capture_output=True, text=True, check=True)
            print(result.stdout)
            if result.stderr: # pip sometimes prints warnings to stderr
                print(result.stderr, file=sys.stderr)
            print(f"Successfully installed/updated {package}.")
        except subprocess.CalledProcessError as e:
            print(f"Failed to install {package}. Error:\n{e.stderr}", file=sys.stderr)
        except FileNotFoundError:
            print(f"Error: '{sys.executable} -m pip' command not found. Please ensure pip is installed and accessible.", file=sys.stderr)
            break # Stop if pip is not found
        except Exception as e:
            print(f"An error occurred while installing {package}: {e}", file=sys.stderr)
