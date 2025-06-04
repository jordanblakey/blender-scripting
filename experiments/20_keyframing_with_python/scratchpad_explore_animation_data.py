import os
from math import tau
from pathlib import Path

import bpy

import butils

dirname: os.PathLike = Path(os.path.dirname(__file__))
blend_file: os.PathLike = Path(os.path.splitext(__file__)[0] + ".blend")
butils.scene.clean()
butils.blend_file.create_or_open(blend_file)


def add_geometry():
    bpy.ops.mesh.primitive_torus_add()


def animate():
    obj = bpy.context.active_object
    if not obj or not isinstance(obj.data, bpy.types.Mesh):
        raise TypeError()
    obj.keyframe_insert("rotation_euler", index=0, frame=1)
    obj.rotation_euler.x = tau
    obj.keyframe_insert("rotation_euler", index=0, frame=250)
    if not isinstance(obj.animation_data, bpy.types.AnimData):
        raise TypeError()
    animation_data: bpy.types.AnimData = obj.animation_data
    if not isinstance(animation_data.action, bpy.types.Action):
        raise TypeError()
    # action: bpy.types.Action = animation_data.action
    # print(action)
    # print(action.curve_frame_range)

    # action_slots: bpy.types.ActionSlots = action.slots
    # action_slot: bpy.types.ActionSlot = list(action_slots)[0]
    # print(action_slot)

    # action_layers = bpy.types.ActionLayers = action.layers
    # action_layer = bpy.types.ActionLayer = list(action_layers)[0]
    # print(action_layer)

    # action_strips: bpy.types.ActionStrips = action_layer.strips
    # action_strip: bpy.types.ActionStrip = list(action_strips)[0]
    # print(action_strip)

    # action_channelbag: bpy.types.ActionChannelbag = action_strip.channelbag(
    #     action_slot
    # )
    # print(action_channelbag)
    # action_channelbag_fcurves: bpy.types.ActionChannelbagFCurves = (
    #     action_channelbag.fcurves
    # )
    # fcurve: bpy.types.FCurve = list(action_channelbag_fcurves)[0]
    # print(fcurve)
    # print(fcurve.data_path)  # rotation_euler
    # print(fcurve.array_index)  # 0 , x
    # fcurve.color = mathutils.Color((1, 0, 1))  # should be magenta, but isnt ???
    # keyframe_points: bpy.types.FCurveKeyframePoints = fcurve.keyframe_points
    # print(keyframe_points)
    # for keyframe in keyframe_points:
    #     print(keyframe.co)
    #     keyframe.co.x = (keyframe.co.x + 125) / 2
    #     keyframe.interpolation = "EXPO"
    #     keyframe.easing = "EASE_OUT"

    # keyframe: bpy.types.Keyframe = list(keyframe_points)[0]

    # print(keyframe)
    # easing: butils.btyping.BeztripleInterpolationEasingItems = (
    #     keyframe.easing
    # )
    # co: mathutils.Vector = keyframe.co
    # handle_left: mathutils.Vector = keyframe.handle_left
    # handle_left_type: butils.btyping.KeyframeHandleTypeItems = (
    #     keyframe.handle_left_type
    # )
    # handle_left: mathutils.Vector = keyframe.handle_right
    # handle_right_type: butils.btyping.KeyframeHandleTypeItems = (
    #     keyframe.handle_right_type
    # )
    # interpolation: butils.btyping.BeztripleInterpolationModeItems = (
    #     keyframe.interpolation
    # )
    # iterpolation = "CONSTANT"


# print(action.layers[0].strips)
# print(action.layers[0].strips[0])
# print(action.layers[0].strips[0].channelbag(action.slots[0]).fcurves)


def main():
    add_geometry()
    animate()


main()
butils.blend_file.save(blend_file)
butils.render.quick_render(
    cwd=dirname,
    viewport=False,
    animation=False,
)
print("Done.")


# print(action.fcurves)
# print(slot.active)
# print(slot.name_display)
# print(slot.select)
# print(slot.show_expanded)
# print(animation_data.action_suitable_slots.__len__())
# print(animation_data.action_slot_handle)
# print(animation_data.action_slot)
# print(len(action.layers))
# print(len(action.layers[0].strips))
# print(action.layers[0].strips[0])
# animation_data: bpy.types.AnimData = obj.animation_data

# action: bpy.types.Action = obj.animation_data.action
# slot: bpy.types.ActionSlot = obj.animation_data.action_slot
# channelbag: bpy.types.ActionChannelbag = getattr(
#     action.layers[0].strips[0], "channelbag"
# )(slot)


# def get_channelbag(obj: bpy.types.Object) -> bpy.types.ActionChannelbag:
#     if not obj.animation_data or not obj.animation_data.action:
#         raise TypeError()

#     channelbag: bpy.types.ActionChannelbag = getattr(
#         obj.animation_data.action.layers[0].strips[0], "channelbag"
#     )(obj.animation_data.action_slot)
#     return channelbag

# obj.keyframe_insert("rotation_euler", index=0, frame=1)
# obj.rotation_euler.x = tau
# obj.keyframe_insert("rotation_euler", index=0, frame=250)
# obj.keyframe_insert("location", index=0, frame=1)
# obj.location.x = 10
# obj.keyframe_insert("location", index=0, frame=250)

# fcurves = butils.animation.get_fcurves(obj)
# for fcurve in fcurves:
#     print(fcurve.data_path, fcurve.array_index)
# print(fcurves.keys())

# location_fcurve = butils.animation.get_fcurve("location", 0, fcurves)
# if not location_fcurve:
#     raise TypeError()
# print(location_fcurve.keyframe_points)
# location_fcurve.keyframe_points[1].co.y = 10
# location_fcurve.keyframe_points[0].interpolation = "EXPO"
# location_fcurve.keyframe_points[0].easing = "EASE_IN_OUT"

# rotation_fcurve = butils.animation.get_fcurve(
#     "rotation_euler", 0, fcurves
# )
# if not rotation_fcurve:
#     raise TypeError()
# rotation_fcurve.keyframe_points[1].co.y = tau
# rotation_fcurve.keyframe_points[0].interpolation = "EXPO"
# rotation_fcurve.keyframe_points[0].easing = "EASE_IN_OUT"
