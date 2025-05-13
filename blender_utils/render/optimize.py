import bpy

from blender_utils.btyping.cycles.properties import CyclesRenderSettings
from blender_utils.helpers import clip_values
from blender_utils.render.update_mask import CyclesUpdateMask, RenderUpdateMask


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
