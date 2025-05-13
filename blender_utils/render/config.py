import os

import bpy
from bpy.types import Scene

from blender_utils.typing import RenderEngineTypeItems


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
    engine: RenderEngineTypeItems = "BLENDER_EEVEE_NEXT",
    time_limit: int = 5,
    use_denoising: bool = False,
) -> None:
    """
    Configure the rendering engine.
    """
    if not isinstance(bpy.context.scene, Scene):
        raise TypeError()
    bpy.context.scene.render.engine = engine  # type: ignore
    cycles = bpy.context.scene.cycles
    if engine == "CYCLES" and cycles:
        # This is a per frame time limit for cycles
        cycles.time_limit = time_limit
        # Skip denoising which is relatively expensive for a simple render like this
        cycles.use_denoising = use_denoising

    elif engine == "BLENDER_EEVEE_NEXT":
        pass

    elif engine == "WORKBENCH":
        pass
