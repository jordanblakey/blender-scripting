import os

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
    symlink_path = os.path.join(user_scripts_path, "modules", "butils")
    create_symlink("butils", source_path, symlink_path)

    print("make butils module symlink so it's available to scripts:")
    install_requirements()
    print("Installation process complete.")


def run_in_blender(expr):
    expr = f"import bpy;{expr}"
    wrap = os.popen(f'blender --quiet --background --python-expr "{expr}"')
    return wrap.read().strip()


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
    requirements = open(
        os.path.join(get_root("blender-scripting"), "requirements.txt")
    ).readlines()
    expr = "print(bpy.utils.script_path_user())"
    user_scripts_path = run_in_blender(expr)

    for package in requirements:
        package = package.strip().split("=")[0]
        install_path = os.path.join(user_scripts_path, "modules", package)
        cmd = f"pip install {package} --target={install_path} --upgrade"
        stdout = os.popen(cmd).read()
        print(stdout)
