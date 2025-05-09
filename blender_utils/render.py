import bpy
import os
from . import ui


def render(cwd, engine='BLENDER_EEVEE_NEXT', resolution_percentage=100,
           image=True, image_format='PNG', animation=False,
           animation_format='FFMPEG', fps=60):

    ui.set_view3d_shading_type('RENDERED')
    ui.set_view3d_persective('CAMERA')

    # set render paths
    render_dir = os.path.join(cwd, 'renders')
    os.makedirs(render_dir, exist_ok=True)
    bpy.context.scene.render.filepath = os.path.join(
        render_dir, f'render@{resolution_percentage}%')

    # config engine
    bpy.context.scene.render.engine = engine
    if engine == 'CYCLES':
        # This is a per frame time limit for cycles
        bpy.context.scene.cycles.time_limit = 5
        # Skip denoising which is relatively expensive for a simple render like this
        bpy.context.scene.cycles.use_denoising = False
    elif engine == 'BLENDER_EEVEE_NEXT':
        pass

    # render image
    bpy.context.scene.render.resolution_percentage = resolution_percentage
    bpy.context.scene.render.image_settings.file_format = image_format
    if image:
        bpy.ops.render.render(write_still=True)

    # render video
    bpy.context.scene.render.fps = fps
    time_scale_factor = int(fps / 30)
    bpy.context.scene.frame_end = bpy.context.scene.frame_end * time_scale_factor
    bpy.context.scene.render.frame_map_new = 100 * time_scale_factor

    bpy.context.scene.render.image_settings.file_format = animation_format
    if animation:
        bpy.ops.render.render(animation=True)
