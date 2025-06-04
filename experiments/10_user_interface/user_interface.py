import math
import os

import bpy

RENDER_STILLS = True
RENDER_ANIMATION = True
SIZE = 2160

# bookmark globals
window = bpy.context.window_manager.windows[0]
world = bpy.data.worlds[0]
scene = bpy.data.scenes[0]
clipboard = bpy.context.window_manager.clipboard
camera = scene.camera
light = bpy.data.objects[bpy.data.objects.find("Light")]

# create a .blend file
bpy.ops.wm.save_as_mainfile(filepath=os.path.splitext(__file__)[0] + ".blend")


def clean_scene():
    bpy.ops.object.select_all(action="SELECT")
    camera.select_set(False)
    light.select_set(False)
    bpy.ops.object.delete()
    bpy.ops.outliner.orphans_purge(
        do_local_ids=True, do_linked_ids=True, do_recursive=True
    )


def setup_scene():
    background = world.node_tree.nodes["Background"]
    background.inputs[0].default_value = (1, 0.04, 0, 1)
    light.data.color = (0, 0.03, 1)
    light.data.energy = 5000
    light.data.shadow_soft_size = 10


def set_view_perspective(perspective="CAMERA"):
    # set the window layout
    window.workspace = bpy.data.workspaces["Layout"]
    for area in window.screen.areas:
        if area.type == "VIEW_3D":
            break
    for space in area.spaces:
        if space.type == "VIEW_3D":
            break

    # ['PERSP', 'ORTHO', 'CAMERA']
    space.region_3d.view_perspective = perspective


def render():
    bpy.context.scene.frame_current = 50

    renders_dir = os.path.join(os.path.dirname(__file__), "_renders")
    os.makedirs(renders_dir, exist_ok=True)

    if RENDER_STILLS:
        scene.render.image_settings.file_format = "PNG"
        scene.render.resolution_x = int(SIZE * 16 / 9)
        scene.render.resolution_y = SIZE

        # render viewport in perspective mode
        scene.render.filepath = os.path.join(renders_dir, "persp_viewport")
        set_view_perspective("PERSP")
        bpy.ops.render.opengl(write_still=True, view_context=True)

        # render viewport in orthographic mode
        scene.render.filepath = os.path.join(renders_dir, "ortho_viewport")
        set_view_perspective("ORTHO")
        bpy.ops.render.opengl(write_still=True, view_context=True)

        # render viewport in camera mode
        scene.render.filepath = os.path.join(renders_dir, "camera_viewport")
        set_view_perspective("CAMERA")
        bpy.ops.render.opengl(write_still=True, view_context=True)

        # render camera view
        scene.render.filepath = os.path.join(renders_dir, "camera_view")
        bpy.ops.render.render(write_still=True)

    if RENDER_ANIMATION:
        # render animation
        scene.render.fps = 60
        scene.render.frame_map_new = 200
        scene.frame_end = 500

        scene.render.filepath = os.path.join(renders_dir, "animation")
        scene.render.image_settings.file_format = "FFMPEG"
        scene.render.ffmpeg.format = "MKV"
        bpy.ops.render.render(animation=True)


def create_cube_array():
    size = 10
    spacing = 4

    bpy.ops.mesh.primitive_cube_add()

    for i in range(size):
        for j in range(size):
            bpy.ops.object.duplicate()
            bpy.context.active_object.location.x = -i * spacing
            bpy.context.active_object.location.y = j * spacing


def animate_camera():
    camera.data.lens = 300
    camera.data.keyframe_insert(data_path="lens", frame=1)
    camera.data.lens = 68
    camera.data.keyframe_insert(data_path="lens", frame=50)

    camera.location = (7.35889, -6.92579, 4.95831)
    camera.rotation_euler = (math.radians(63.5), 0, math.radians(47))
    camera.keyframe_insert(data_path="location", frame=50)
    camera.keyframe_insert(data_path="rotation_euler", index=0, frame=50)
    camera.keyframe_insert(data_path="rotation_euler", index=2, frame=50)

    camera.keyframe_insert(data_path="location", frame=75)
    camera.keyframe_insert(data_path="rotation_euler", index=0, frame=75)
    camera.keyframe_insert(data_path="rotation_euler", index=2, frame=75)
    light.data.keyframe_insert(data_path="energy", frame=75)
    light.data.keyframe_insert(data_path="color", frame=75)
    light.data.energy = 1e4
    light.data.color = (0, 1, 0)
    camera.location = (0, 0, 10)
    camera.rotation_euler.x = 0
    camera.rotation_euler.z = 0

    camera.keyframe_insert(data_path="location", frame=125)
    camera.keyframe_insert(data_path="rotation_euler", index=0, frame=125)
    camera.keyframe_insert(data_path="rotation_euler", index=2, frame=125)
    light.data.keyframe_insert(data_path="energy", frame=125)
    light.data.keyframe_insert(data_path="color", frame=125)

    camera.keyframe_insert(data_path="location", frame=150)
    camera.location = (-18, 18, 20)
    camera.data.keyframe_insert(data_path="lens", frame=150)
    camera.data.lens = 9
    light.data.keyframe_insert(data_path="energy", frame=150)
    light.data.energy = 1
    world.node_tree.nodes["Background"].inputs[0].keyframe_insert(
        data_path="default_value", frame=150
    )
    world.node_tree.nodes["Background"].inputs[0].default_value = (1, 1, 1, 1)

    light.data.keyframe_insert(data_path="energy", frame=225)
    camera.keyframe_insert(data_path="location", frame=225)
    camera.data.keyframe_insert(data_path="lens", frame=225)
    world.node_tree.nodes["Background"].inputs[0].keyframe_insert(
        data_path="default_value", frame=225
    )


def main():
    clean_scene()
    setup_scene()
    animate_camera()
    create_cube_array()
    render()
    print("end")


main()
