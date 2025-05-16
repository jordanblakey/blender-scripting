import os
from math import tau
from pathlib import Path

import bpy

import blender_utils
from blender_utils.animation.keyframe import edit_keyframe, insert_keyframe

dirname: os.PathLike = Path(os.path.dirname(__file__))
blend_file: os.PathLike = Path(os.path.splitext(__file__)[0] + ".blend")
blender_utils.scene.clean()
blender_utils.blend_file.create_or_open(blend_file)


def add_geometry():
    bpy.ops.mesh.primitive_torus_add()


def animate():
    # insert keyframes
    obj = bpy.context.active_object
    if not obj or not isinstance(obj.data, bpy.types.Mesh):
        raise TypeError()

    # define basic animation properties on insert
    insert_keyframe(
        obj,
        "rotation_euler",
        index=0,
        frame=1,
        interpolation="EXPO",
        easing="EASE_IN_OUT",
    )

    # alternatively, insert then edit
    key = insert_keyframe(obj, "rotation_euler", frame=30, index=0)
    edit_keyframe(key, value=tau, interpolation="SINE", easing="EASE_IN_OUT")


def setup_scene():
    blender_utils.scene.setup_starter_scene()


def main():
    setup_scene()
    add_geometry()
    animate()


main()
blender_utils.blend_file.save(blend_file)
setattr(bpy.context.scene, "frame_end", 75)
blender_utils.render.quick_render(cwd=dirname, viewport=False, animation=True)
print("Done.")
