import inspect
import os
import subprocess
import typing

import bpy
import typing_extensions


def main():
    print("make cycles module symlink here for type checking:")
    scripts_path = bpy.utils.script_paths()[0]
    source_path = os.path.join(scripts_path, "addons_core", "cycles")
    symlink_path = os.path.join(os.path.dirname(__file__), "typing", "cycles")
    create_symlink("blender_utils.typing.cycles", source_path, symlink_path)

    print("make blender_utils module symlink so it's available to scripts:")
    source_path = os.path.abspath(os.path.dirname(str(__file__)))
    symlink_path = os.path.join(bpy.utils.user_resource("SCRIPTS"), "modules")
    create_symlink("blender_utils", source_path, symlink_path)

    print("make blender_utils module symlink so it's available to scripts:")
    install_requirements()


def create_symlink(module_name, source_path, symlink_path):
    """Create a symlink for module by name, given source and symlink paths."""
    print(f"creating {symlink_path}...", end="")

    # check exists
    if os.path.exists(symlink_path):
        print("already exists")

    else:
        # create symlink
        os.symlink(source_path, symlink_path)

        # check it was created
        if os.path.exists(symlink_path):
            print("created")
        else:
            print("creation failed")

    # check importing works
    if module_name:
        validate_importable(module_name)


def validate_importable(module_name):
    """Validate `import` works for a module by name."""
    R, G, C = "\033[91m", "\033[92m", "\033[0m"
    try:
        __import__(module_name)
    except ImportError:
        print(f"{R}FAIL: `{module_name}` is not importable{C}\n")
        return False
    else:
        print(f"{G}SUCCESS: `{module_name}` is importable{C}\n")
        return True


def install_requirements():
    """Install requirements.txt in Blender user scripts, allowing imports."""
    requirements = open("../requirements.txt").readlines()
    user_scripts_path = bpy.utils.user_resource("SCRIPTS")

    for package in requirements:
        package = package.strip().split("=")[0]
        install_path = os.path.join(user_scripts_path, "modules", package)
        cmd = f"pip install {package} --target={install_path} --upgrade"
        stdout = os.popen(cmd).read()
        print(stdout)


main()
