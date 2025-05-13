import subprocess

import bpy

from blender_utils.btyping.cycles.properties import CyclesRenderSettings
from blender_utils.render import CyclesUpdateMask, RenderUpdateMask


def main():
    if not bpy.context.scene or not bpy.context.scene.cycles:
        raise TypeError()
    render: bpy.types.RenderSettings = bpy.context.scene.render
    cycles: CyclesRenderSettings = bpy.context.scene.cycles

    # clip_values(render) #  copy attrs and vals of object

    RenderUpdateMask(render, engine="CYCLES").apply()
    CyclesUpdateMask(
        cycles,
        use_preview_adaptive_sampling=True,
        preview_samples=2048,
        use_preview_denoising=True,
        preview_denoising_use_gpu=True,
    ).apply()


def clip_values(obj):
    output = []

    def set_clipboard_data(text):
        p = subprocess.Popen(
            ["xsel", "-b", "-i"], stdin=subprocess.PIPE, encoding="utf-8"
        )
        p.communicate(text)

    for key in dir(obj):
        if not key.startswith("_"):
            line = f"{key}: {type(getattr(obj, key)).__name__} = {getattr(obj, key)}"
            output.append(line)
    set_clipboard_data("\n".join(output))


main()
