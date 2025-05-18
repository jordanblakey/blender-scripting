import pathlib

import bpy

if hasattr(bpy, "context"):
    # running in blender, so load modules
    from butils import (
        animation,
        blend_file,
        btyping,
        mesh,
        render,
        scene,
        ui,
    )


def get_root(dirname="blender-scripting"):
    path = pathlib.Path(__file__)
    parts_slice = path.parts[: path.parts.index(dirname) + 1]
    return path.joinpath(*parts_slice)
