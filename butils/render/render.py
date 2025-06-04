import os

import bpy
from bpy.types import Scene

from butils import btyping, render, ui


def quick_render(
    cwd: str | os.PathLike,
    engine: btyping.RenderEngineTypeItems = "BLENDER_EEVEE_NEXT",
    resolution_percentage: int = 100,
    viewport: bool = True,
    shading_type: btyping.ShadingTypeItems = "SOLID",
    view3d_perspective: btyping.ViewPerspectiveTypeItems = "ORTHO",
    image: bool = False,
    image_format: btyping.ImageTypeItems = "PNG",
    animation: bool = False,
    animation_format: btyping.ImageTypeItems = "FFMPEG",
    fps: int = 60,
) -> None:
    """
    Quickly render the scene with some basic options.
    """
    render.config_engine(engine)

    if viewport:
        render.config_render_paths(
            cwd, filename="opengl", resolution_percentage=resolution_percentage
        )
        render_viewport(
            image_format,
            resolution_percentage,
            shading_type=shading_type,
            view_perspective=view3d_perspective,
        )
    if image:
        render.config_render_paths(
            cwd, filename="still", resolution_percentage=resolution_percentage
        )
        render_image(image_format, resolution_percentage)
    if animation:
        render.config_render_paths(
            cwd,
            filename="animation",
            resolution_percentage=resolution_percentage,
        )
        render_animation(animation_format, fps)


def render_viewport(
    image_format: btyping.ImageTypeItems = "PNG",
    resolution_percentage: int = 100,
    shading_type: btyping.ShadingTypeItems = "SOLID",
    view_perspective: btyping.ViewPerspectiveTypeItems = "ORTHO",
) -> None:
    """
    Render the viewport, setting the perspective mode and shading type.
    """
    # config viewport
    ui.set_view3d_shading_type(shading_type)
    ui.set_view3d_perspective(view_perspective)

    # config format and resolution
    if not isinstance(bpy.context.scene, Scene):
        raise TypeError()
    bpy.context.scene.render.resolution_percentage = resolution_percentage
    bpy.context.scene.render.image_settings.file_format = image_format

    # render
    bpy.ops.render.opengl(write_still=True, view_context=True)


def render_image(
    image_format: btyping.ImageTypeItems = "PNG",
    resolution_percentage: int = 100,
) -> None:
    """
    Render a still image using the scene camera.
    """
    # config format and resolution
    if not isinstance(bpy.context.scene, Scene):
        raise TypeError()
    bpy.context.scene.render.resolution_percentage = resolution_percentage
    bpy.context.scene.render.image_settings.file_format = image_format

    # render
    bpy.ops.render.render(write_still=True)


def render_animation(
    animation_format: btyping.ImageTypeItems = "FFMPEG", fps: int = 60
) -> None:
    """
    Render an animation sequence using the scene camera.
    """
    # config timing
    if not isinstance(bpy.context.scene, Scene):
        raise TypeError()
    bpy.context.scene.render.fps = fps
    time_scale_factor = int(fps / 30)
    bpy.context.scene.frame_end = (
        bpy.context.scene.frame_end * time_scale_factor
    )
    bpy.context.scene.render.frame_map_new = 100 * time_scale_factor

    # config format and encoding
    bpy.context.scene.render.image_settings.file_format = animation_format

    # render
    bpy.ops.render.render(animation=True)
