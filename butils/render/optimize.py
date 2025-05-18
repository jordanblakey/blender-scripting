import subprocess

import bpy

from butils.btyping.cycles.properties import CyclesRenderSettings
from butils.render.update_mask import CyclesUpdateMask, RenderUpdateMask


def apply_fast_cycles_preset():
    if not bpy.context.scene or not bpy.context.scene.cycles:
        raise TypeError()
    render: bpy.types.RenderSettings = bpy.context.scene.render
    cycles: CyclesRenderSettings = bpy.context.scene.cycles

    # clip_values(render)  #  copy attrs and vals of object - use to extend
    render_update_mask = RenderUpdateMask(
        obj=render, engine="CYCLES", use_persistent_data=True
    )
    render_update_mask.apply()

    # clip_values(cycles) #  copy attrs and vals of object - use to extend
    cycles_update_mask = CyclesUpdateMask(
        obj=cycles,
        device="GPU",
        denoising_prefilter="FAST",
        denoising_quality="FAST",
        denoising_use_gpu=True,
        max_bounces=8,
    )
    cycles_update_mask.apply()


def clip_values(obj):
    """Copy keys and values of obj.dir() to clipboard, omitting __*__ attrs."""
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
