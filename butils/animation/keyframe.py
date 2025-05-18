import bpy

import butils
import butils.btyping


def insert_keyframe(
    obj: bpy.types.Object,
    data_path: str,
    frame: int,
    index: int = -1,
    value: None | float = None,
    easing: None | butils.btyping.BeztripleInterpolationEasingItems = None,
    interpolation: None | butils.btyping.BeztripleInterpolationModeItems = None,
) -> bpy.types.Keyframe:
    obj.keyframe_insert(data_path, index=index, frame=frame)
    keyframe = get_keyframe(obj, data_path, index=index, frame=frame)
    if not keyframe:
        raise ValueError("Failed to insert keyframe.")
    if value:
        keyframe.co.y = value
    if interpolation:
        keyframe.interpolation = interpolation
    if easing:
        keyframe.easing = easing
    return keyframe


def get_keyframe(
    obj: bpy.types.Object,
    data_path: str,
    frame: int,
    index: int = -1,
) -> None | bpy.types.Keyframe:
    fcurves = butils.animation.get_fcurves(obj)
    fcurve = butils.animation.get_fcurve(data_path, index, fcurves)
    if not fcurve:
        return
    for keyframe in fcurve.keyframe_points:
        if keyframe.co.x == frame:
            return keyframe


def edit_keyframe(
    keyframe: bpy.types.Keyframe,
    value: None | float = None,
    easing: None | butils.btyping.BeztripleInterpolationEasingItems = None,
    interpolation: None | butils.btyping.BeztripleInterpolationModeItems = None,
) -> bool:
    if not keyframe:
        return False
    if value:
        keyframe.co.y = value
    if interpolation:
        keyframe.interpolation = interpolation
    if easing:
        keyframe.easing = easing
    return True


def delete_keyframe(
    obj: bpy.types.Object, data_path: str, frame: int, index: int = -1
):
    fcurves = butils.animation.get_fcurves(obj)
    fcurve = butils.animation.get_fcurve(data_path, index, fcurves)
    if not fcurve:
        return False
    fcurves.keyframe_delete(data_path, index=index, frame=frame)
    return True
