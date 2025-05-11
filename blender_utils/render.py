import os
from typing import Literal

import bpy
from bpy._typing.rna_enums import ImageTypeItems, ShadingTypeItems
from bpy.types import Scene

from blender_utils import ui

EngineType = Literal["BLENDER_EEVEE_NEXT"]
ImageFormatType = Literal["PNG"]


def quick_render(
    cwd: os.PathLike,
    engine: EngineType = "BLENDER_EEVEE_NEXT",
    resolution_percentage: int = 100,
    viewport: bool = True,
    shading_type: ShadingTypeItems = "SOLID",
    view3d_perspective: Literal["PERSP", "ORTHO", "CAMERA"] = "ORTHO",
    image: bool = False,
    image_format: ImageFormatType = "PNG",
    animation: bool = False,
    animation_format: Literal["FFMPEG"] = "FFMPEG",
    fps: int = 60,
) -> None:
    """
    Quickly render the scene with some basic options.
    """
    config_engine(engine)

    if viewport:
        config_render_paths(
            cwd, filename="opengl", resolution_percentage=resolution_percentage
        )
        render_viewport(
            image_format,
            resolution_percentage,
            shading_type=shading_type,
            view_perspective=view3d_perspective,
        )
    if image:
        config_render_paths(
            cwd, filename="still", resolution_percentage=resolution_percentage
        )
        render_image(image_format, resolution_percentage)
    if animation:
        config_render_paths(
            cwd,
            filename="animation",
            resolution_percentage=resolution_percentage,
        )
        render_animation(animation_format, fps)


def config_render_paths(
    cwd: os.PathLike,
    filename: str = "render",
    resolution_percentage: int | None = None,
) -> None:
    """
    Create paths for rendering relative to the calling script.
    """
    render_dir = os.path.join(cwd, "renders")
    os.makedirs(render_dir, exist_ok=True)
    if not isinstance(bpy.context.scene, Scene):
        raise TypeError()
    res = str(resolution_percentage) if resolution_percentage else ""
    bpy.context.scene.render.filepath = os.path.join(
        render_dir, f"{filename}{'@' + res if res else ''}"
    )


def config_engine(
    engine: EngineType = "BLENDER_EEVEE_NEXT",
    time_limit: int = 5,
    use_denoising: bool = False,
) -> None:
    """
    Configure the rendering engine.
    """
    if not isinstance(bpy.context.scene, Scene):
        raise TypeError()
    bpy.context.scene.render.engine = engine
    if engine == "CYCLES":
        # This is a per frame time limit for cycles
        bpy.context.scene.cycles.time_limit = time_limit
        # Skip denoising which is relatively expensive for a simple render like this
        bpy.context.scene.cycles.use_denoising = use_denoising

    elif engine == "BLENDER_EEVEE_NEXT":
        pass

    elif engine == "WORKBENCH":
        pass


def render_viewport(
    image_format: ImageTypeItems = "PNG",
    resolution_percentage: int = 100,
    shading_type: ShadingTypeItems = "SOLID",
    view_perspective: Literal["PERSP", "ORTHO", "CAMERA"] = "ORTHO",
) -> None:
    """
    Render the viewport, setting the perspective mode and shading type.
    """
    # config viewport
    ui.set_view3d_shading_type(shading_type)
    ui.set_view3d_persective(view_perspective)

    # config format and resolution
    if not isinstance(bpy.context.scene, Scene):
        raise TypeError()
    bpy.context.scene.render.resolution_percentage = resolution_percentage
    bpy.context.scene.render.image_settings.file_format = image_format

    # render
    bpy.ops.render.opengl(write_still=True, view_context=True)


def render_image(
    image_format: ImageFormatType = "PNG", resolution_percentage: int = 100
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
    animation_format: ImageTypeItems = "FFMPEG", fps: int = 60
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
