import math
from typing import Type

import bpy


def main():
    empties, previous_empty = create_empties()
    current_frame = animate(empties, previous_empty)
    setup_scene(current_frame)


def create_empties():
    cube = bpy.data.objects["Cube"]
    if not cube:
        raise TypeError()
    empty_locations = [
        (0, 0, 0),
        (0, 0, cube.dimensions.z),
        (0, cube.dimensions.y, 0),
        (0, 0, -cube.dimensions.z),
    ]
    previous_empty = None
    empties = []
    for location in empty_locations:
        bpy.ops.object.empty_add()
        empty = bpy.context.active_object
        if not empty:
            raise TypeError()
        if previous_empty:
            empty.parent = previous_empty
        empty.location = location
        empties.append(empty)
        previous_empty = empty
    return empties, previous_empty


def animate(empties, previous_empty):
    cube = bpy.data.objects["Cube"]
    rotation_animation_length = 15
    current_frame = 1
    rotation_angle = -90

    for empty in empties:
        empty.keyframe_insert("rotation_euler", frame=current_frame)
        empty.rotation_euler.x = -math.radians(rotation_angle)

        current_frame += rotation_animation_length
        empty.keyframe_insert("rotation_euler", frame=current_frame)
    cube.parent = previous_empty
    cube.location.y = -cube.dimensions.y / 2
    cube.location.z = cube.dimensions.z / 2
    return current_frame


def setup_scene(current_frame):
    scene = bpy.context.scene
    if not scene or not scene.camera:
        raise TypeError()
    scene.frame_end = current_frame + 30
    scene.render.image_settings.file_format = "FFMPEG"
    scene.camera.location = (0, 0, 50)
    scene.camera.rotation_euler = (0, 0, 0)

    # bpy.ops.render.render(animation=True)


main()
