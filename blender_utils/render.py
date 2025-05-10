import bpy
import os
from . import ui


def quick_render(cwd, engine='BLENDER_EEVEE_NEXT', resolution_percentage=100,
                 viewport=True, shading_type='SOLID',
                 view3d_perspective='ORTHO', image=False, image_format='PNG',
                 animation=False, animation_format='FFMPEG', fps=60):

    config_engine(engine)

    if viewport:
        config_render_paths(cwd, filename='opengl',
                            resolution_percentage=resolution_percentage)
        render_viewport(image_format, resolution_percentage,
                        shading_type=shading_type,
                        view_perspective=view3d_perspective)
    if image:
        config_render_paths(cwd, filename='still',
                            resolution_percentage=resolution_percentage)
        render_image(image_format, resolution_percentage)
    if animation:
        config_render_paths(cwd, filename='animation',
                            resolution_percentage=resolution_percentage)
        render_animation(animation_format, fps)


def config_render_paths(cwd, filename='render', resolution_percentage=100):
    render_dir = os.path.join(cwd, 'renders')
    os.makedirs(render_dir, exist_ok=True)
    bpy.context.scene.render.filepath = os.path.join(
        render_dir, f'{filename}@{resolution_percentage}')


def config_engine(engine='BLENDER_EEVEE_NEXT', time_limit=5,
                  use_denoising=False):
    bpy.context.scene.render.engine = engine
    if engine == 'CYCLES':
        # This is a per frame time limit for cycles
        bpy.context.scene.cycles.time_limit = time_limit
        # Skip denoising which is relatively expensive for a simple render like this
        bpy.context.scene.cycles.use_denoising = use_denoising

    elif engine == 'BLENDER_EEVEE_NEXT':
        pass

    elif engine == 'WORKBENCH':
        pass


def render_viewport(image_format='PNG', resolution_percentage=100,
                    shading_type="SOLID", view_perspective='ORTHO'):
    # config viewport
    ui.set_view3d_shading_type(shading_type)
    ui.set_view3d_persective(view_perspective)

    # config format and resolution
    bpy.context.scene.render.resolution_percentage = resolution_percentage
    bpy.context.scene.render.image_settings.file_format = image_format

    # render
    bpy.ops.render.opengl(write_still=True, view_context=True)


def render_image(image_format='PNG', resolution_percentage=100):
    # config format and resolution
    bpy.context.scene.render.resolution_percentage = resolution_percentage
    bpy.context.scene.render.image_settings.file_format = image_format

    # render
    bpy.ops.render.render(write_still=True)


def render_animation(animation_format='FFMPEG', fps=60):
    # config timing
    bpy.context.scene.render.fps = fps
    time_scale_factor = int(fps / 30)
    bpy.context.scene.frame_end = bpy.context.scene.frame_end * time_scale_factor
    bpy.context.scene.render.frame_map_new = 100 * time_scale_factor

    # config format and encoding
    bpy.context.scene.render.image_settings.file_format = animation_format

    # render
    bpy.ops.render.render(animation=True)
