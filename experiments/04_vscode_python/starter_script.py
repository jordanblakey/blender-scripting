import bpy
import os


def create_or_open_blend_file() -> None:
    path, file = os.path.split(__file__)
    blend_file = os.path.splitext(file)[0] + ".blend"
    blend_file_path = os.path.join(path, blend_file)
    if not os.path.exists(blend_file_path):
        bpy.ops.wm.save_as_mainfile(filepath=os.path.join(path, blend_file))
    elif bpy.data.filepath == blend_file_path:
        print(f"{blend_file} already open.")
    else:
        bpy.ops.wm.open_mainfile(filepath=blend_file_path)


def set_workspace() -> None:
    """set the workspace to shading to work on materials"""
    target_workspace = bpy.data.workspaces[bpy.data.workspaces.find("Shading")]
    window = bpy.context.window_manager.windows[0]
    window.workspace = target_workspace


def clean_scene() -> None:
    """Reset the scene so that the script runs cleanly each time."""
    for obj in bpy.context.scene.objects:
        bpy.data.objects.remove(obj)


def main():
    create_or_open_blend_file()
    set_workspace()
    clean_scene()


main()
