import math
from typing import Dict, Literal

import bpy
from bpy._typing.rna_enums import ShadingTypeItems, SpaceTypeItems
from bpy.types import Area, Region, Screen, SpaceView3D, Window
from mathutils import Euler, Vector


def get_context(
    name: SpaceTypeItems,
) -> Dict[str, Window | Screen | Area | Region]:
    """
    Gets context for overrides.

    Raises:
        ValueError: if the context can't be found.
        TypeError: if the context doesn't contain a window manager.

    Returns:
        An override context dictionary.
    """
    if not isinstance(bpy.context.window_manager, bpy.types.WindowManager):
        raise TypeError()
    for window in bpy.context.window_manager.windows:
        for area in window.screen.areas:
            if area.type == name:
                for region in area.regions:
                    if region.type == "WINDOW":
                        context = {
                            "window": window,
                            "screen": window.screen,
                            "area": area,
                            "region": region,
                        }
                        return context
    raise ValueError("Couldn't find context for " + name)


def set_view3d_shading_type(
    shading_type: ShadingTypeItems = "RENDERED",
) -> bool:
    """
    Set view3d shading type.

    Raises:
        TypeError: if the context doesn't contain a Screen.
        TypeError: if the context doesn't contain SpaceView3D.

    Returns:
        Boolean result of the operation.
    """
    if not isinstance(bpy.context.screen, Screen):
        raise TypeError()
    for area in bpy.context.screen.areas:
        if area.type == "VIEW_3D":
            for space in area.spaces:
                if space.type == "VIEW_3D":
                    if not isinstance(space, SpaceView3D):
                        raise TypeError()
                    space.shading.type = shading_type
                    return True
    return False


def set_view3d_persective(
    perspective: Literal["PERSP", "ORTHO", "CAMERA"] = "CAMERA",
):
    """
    Set the perspective mode of the viewport.

    Raises:
        TypeError: if the context doesn't contain a Screen.
        TypeError: if the context doesn't contain SpaceView3D or RegionView3D.

    Returns:
        Boolean result of the opreation.
    """
    if not isinstance(bpy.context.screen, bpy.types.Screen):
        raise TypeError()
    for area in bpy.context.screen.areas:
        if area.type == "VIEW_3D":
            for space in area.spaces:
                if space.type == "VIEW_3D":
                    if not isinstance(
                        space, bpy.types.SpaceView3D
                    ) or not isinstance(
                        space.region_3d, bpy.types.RegionView3D
                    ):
                        raise TypeError()
                    space.region_3d.view_perspective = perspective
                    return True
    return False


def set_view_location(
    location: Vector = Vector((0, 0, 0)),
    pitch: float = math.pi / 4,
    roll: float = 0,
    yaw: float = math.pi / 4,
):
    """
    Set the perspective mode of the viewport.

    Raises:
        TypeError: if the context doesn't contain Screen.
        TypeError: if the context doesn't contain SpaceView3D or RegionView3D.

    Returns:
        Boolean result of the operation.
    """
    if not isinstance(bpy.context.screen, bpy.types.Screen):
        raise TypeError()
    for area in bpy.context.screen.areas:
        if area.type == "VIEW_3D":
            for region in area.regions:
                if region.type == "WINDOW":
                    if not region.data:
                        raise TypeError()
                    region.data.view_location = location
                    region.data.view_rotation = Euler(
                        (pitch, roll, yaw), "XYZ"
                    ).to_quaternion()
                    return True
    return False
