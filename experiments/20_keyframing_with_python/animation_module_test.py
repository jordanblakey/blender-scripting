import os
from math import pi, radians

import bpy

import butils
from butils.animation.keyframe import edit_keyframe, insert_keyframe

dirname = os.path.dirname(__file__)
blend_file = os.path.splitext(__file__)[0] + ".blend"
butils.scene.clean()
butils.blend_file.create_or_open(blend_file)


def main():
    setup_scene()
    tori = add_geometry()
    animate(tori)


def add_geometry() -> list[bpy.types.Object]:
    offset = 4
    tori = []
    skip = [(0, 2), (0, 6)]
    for i in range(4):
        for j in range(7):
            if (i, j) in skip:
                continue
            location = (offset * j, offset * i, 0)
            bpy.ops.mesh.primitive_torus_add(location=location)
            tori.append(bpy.context.active_object)

    return tori


def animate(tori: list[bpy.types.Object]):
    start = 1
    end = 100
    combos = [
        ("CONSTANT", "AUTO"),
        ("LINEAR", "AUTO"),
        ("BEZIER", "AUTO"),
        ("BOUNCE", "AUTO"),
        ("ELASTIC", "AUTO"),
    ]
    modes = ["SINE", "QUAD", "CUBIC", "QUART", "QUINT", "EXPO", "CIRC"]
    easings = ["EASE_IN", "EASE_OUT", "EASE_IN_OUT"]
    for easing in easings:
        for mode in modes:
            combos.append((mode, easing))

    for i in range(len(tori)):
        torus = tori[i]
        interpolation = combos[i % len(combos)][0]
        easing = combos[i % len(combos)][1]
        animate_torus(torus, start, end, interpolation, easing)


def animate_torus(
    torus: bpy.types.Object, start: int, end: int, interpolation, easing
):
    key = insert_keyframe(torus, "rotation_euler", frame=start, index=0)
    edit_keyframe(key, interpolation=interpolation, easing=easing)

    key = insert_keyframe(torus, "rotation_euler", frame=end, index=0)
    edit_keyframe(
        key, value=pi * 3.5, interpolation=interpolation, easing=easing
    )


def setup_scene():
    butils.scene.setup_starter_scene()
    camera = bpy.data.objects["Camera"]
    camera.location = (110, -90, 79)
    camera.rotation_euler = (
        radians(60),
        radians(0),
        radians(45),
    )
    constraint = camera.constraints["Track To"]
    camera.constraints.remove(constraint)
    if not isinstance(camera.data, bpy.types.Camera):
        raise TypeError()
    camera.data.type = "ORTHO"
    camera.data.ortho_scale = 40

    context = butils.ui.get_context("VIEW_3D")
    with bpy.context.temp_override(**context):
        bpy.ops.view3d.view_camera()


main()
butils.blend_file.save(blend_file)
setattr(bpy.context.scene, "frame_end", 150)
butils.render.quick_render(cwd=dirname, viewport=False, animation=True)
print("Done.")
