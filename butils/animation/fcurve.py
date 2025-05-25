import bpy

def get_fcurves(obj: bpy.types.Object) -> bpy.types.ActionChannelbagFCurves:
    if not obj.animation_data or not obj.animation_data.action:
        raise TypeError()
    channelbag: bpy.types.ActionChannelbag = getattr(
        obj.animation_data.action.layers[0].strips[0], "channelbag"
    )(obj.animation_data.action_slot)
    return channelbag.fcurves


def get_fcurve(
    data_path: str,
    array_index: int,
    fcurves: bpy.types.ActionChannelbagFCurves,
) -> None | bpy.types.FCurve:
    for fcurve in fcurves:
        if fcurve.data_path == data_path and fcurve.array_index == array_index:
            return fcurve
