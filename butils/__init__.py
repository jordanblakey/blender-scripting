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
