import os
import bpy
import random
import math
import colorsys

fps = 60
loop_seconds = 10
frame_count = fps * loop_seconds
render_size = 2160
shape_count = 100
camera_z = 15


def create_blend_file() -> None:
    path, file = os.path.split(__file__)
    blend_file = os.path.join(path, os.path.splitext(file)[0] + ".blend")
    bpy.ops.wm.save_mainfile(filepath=blend_file)


def clean_scene():
    bpy.ops.object.select_all(action="SELECT")
    bpy.ops.object.delete()
    bpy.ops.outliner.orphans_purge(
        do_local_ids=True, do_linked_ids=True, do_recursive=True
    )


def create_track_target():
    bpy.ops.object.empty_add(type="PLAIN_AXES")
    target = bpy.context.active_object
    target.name = "empty.ctrl"
    bpy.ops.object.constraint_add(type="TRACK_TO")
    target.constraints["Track To"].target = target
    return target


def setup_camera(location, rotation, frame_count, target):
    bpy.ops.object.camera_add(location=location, rotation=rotation)
    camera = bpy.context.active_object
    bpy.context.scene.camera = camera

    camera.data.lens = 70  # focal length
    camera.data.dof.focus_object = target
    # camera.data.dof.use_dof = True
    # camera.data.dof.aperture_fstop = .35

    start_value = camera.data.lens
    mid_value = camera.data.lens - 10
    loop_param(camera.data, "lens", start_value, mid_value, frame_count)


def loop_param(obj, param_name, start_value, mid_value, frame_count):
    setattr(obj, param_name, start_value)
    obj.keyframe_insert(param_name, frame=1)

    setattr(obj, param_name, mid_value)
    obj.keyframe_insert(param_name, frame=frame_count / 2)

    setattr(obj, param_name, start_value)
    obj.keyframe_insert(param_name, frame=frame_count)


def setup_scene(fps, frame_count, render_size):
    world = bpy.data.worlds["World"]
    background = world.node_tree.nodes["Background"]
    background.inputs[0].default_value = (0, 0, 0, 1)

    scene = bpy.context.scene
    scene.frame_end = frame_count
    scene.frame_current = 1

    scene.render.fps = fps
    scene.render.resolution_x = int((render_size * 16) / 9)
    scene.render.resolution_y = render_size
    scene.render.engine = "BLENDER_EEVEE_NEXT"

    scene.render.image_settings.file_format = "FFMPEG"
    scene.render.ffmpeg.format = "MPEG4"
    filepath = os.path.splitext(__file__)[0]
    scene.render.filepath = f"{filepath}.mp4"


def apply_random_color_material(obj):
    r, g, b = colorsys.hls_to_rgb(random.random(), 0.5, 1)
    color = (r, g, b, 1)
    mat = bpy.data.materials.new("random_color")
    mat.use_nodes = True
    mat.node_tree.nodes["Principled BSDF"].inputs["Base Color"].default_value = color
    mat.node_tree.nodes["Principled BSDF"].inputs[
        "Specular IOR Level"
    ].default_value = 0
    obj.data.materials.append(mat)


def add_lights():
    rotation = (math.degrees(90), 0.0, math.pi)
    bpy.ops.object.light_add(type="SUN", rotation=rotation)
    bpy.context.object.data.energy = 100
    bpy.context.object.data.diffuse_factor = 0.05
    bpy.context.object.data.angle = math.pi / 4


def add_geometry():
    for i in range(shape_count):
        bpy.ops.mesh.primitive_cylinder_add(
            vertices=5,
            depth=0.1,
            radius=1 + i * 0.075,
            location=(0, 0, -i * 0.1),
            rotation=(0, 0, 2 * math.pi * (i / shape_count)),
        )
        bpy.ops.object.modifier_add(type="BEVEL")
        bpy.context.object.modifiers["Bevel"].width = 0.02
        active_object = bpy.context.active_object
        active_object.keyframe_insert(data_path="rotation_euler", frame=10 + i)
        active_object.rotation_euler.z = 2 * math.pi
        active_object.keyframe_insert(
            data_path="rotation_euler", frame=frame_count - 10 - i
        )
        for fcurve in active_object.animation_data.action.fcurves:
            for kf in fcurve.keyframe_points:
                kf.interpolation = "BACK"
                kf.easing = "EASE_IN_OUT"

        apply_random_color_material(active_object)


def main():
    create_blend_file()
    clean_scene()

    target = create_track_target()
    setup_camera((0, 0, camera_z), (0, 0, 0), frame_count, target)
    setup_scene(fps, frame_count, render_size)
    add_lights()

    add_geometry()

    bpy.ops.render.render(animation=True)

    print("reached end of script!")


main()
