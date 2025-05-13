import os

import bpy


def main():
    print("make blender_utils module symlink so it's available to scripts:")
    source_path = os.path.abspath(os.path.dirname(str(__file__)))
    symlink_path = os.path.join(bpy.utils.user_resource("SCRIPTS"), "modules")
    create_symlink("blender_utils", source_path, symlink_path)

    print("make cycles module symlink here for type checking:")
    scripts_path = bpy.utils.script_paths()[0]
    source_path = os.path.join(scripts_path, "addons_core", "cycles")
    symlink_path = os.path.join(os.path.dirname(__file__), "typing", "cycles")
    create_symlink("blender_utils.typing.cycles", source_path, symlink_path)


def create_symlink(module_name, source_path, symlink_path):
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
    validate_importable(module_name)


def validate_importable(module_name):
    R, G, C = "\033[91m", "\033[92m", "\033[0m"
    try:
        __import__(module_name)
    except ImportError:
        print(f"{R}FAIL: `{module_name}` is not importable{C}\n")
        return False
    else:
        print(f"{G}SUCCESS: `{module_name}` is importable{C}\n")
        return True


main()
