import os

import bpy


def create_or_open(blend_file: str | os.PathLike[str]) -> None:
    """
    Create a .blend file if it doesn't exist, otherwise open it.
    """
    filepath: str = getattr(bpy.context.blend_data, "filepath", "")
    if filepath and os.path.exists(filepath):
        print("opened existing .blend file.")
    elif os.path.exists(blend_file):
        print(".blend file exists, opening...")
        save(blend_file)
    else:
        print(".blend file does not exist, creating...")
        save(blend_file)


def save(blend_file: str | os.PathLike[str]) -> None:
    """
    Save a .blend file at a location whether it exists or not.
    """
    bpy.ops.wm.save_as_mainfile(filepath=str(blend_file))
