import bpy
import sys
import os
import random
import bmesh
import math

# ENGINE = 'CYCLES'
ENGINE = 'BLENDER_EEVEE_NEXT'
RENDER_SIZE_PERCENTAGE = 200
FRAME_END = 700
RENDER_IMAGE = True
RENDER_ANIMATION = False

################################################################################
# Set Up Script
################################################################################

# blender -b -P headless_mode.py  # debug scripts
# blender -P headless_mode.py  # work in UI

dirname = os.path.dirname(__file__)
blend_file = os.path.splitext(__file__)[0] + '.blend'

# Import custom modules
modules_path = os.path.join(dirname, '..')
if not modules_path in sys.path:
    sys.path.append(modules_path)
import blender_utils  # nopep8

blender_utils.blend_file.create_or_open(blend_file)
blender_utils.scene.clean()

################################################################################
# Start Script
################################################################################


def create_geometry():
    # add ico sphere
    bpy.ops.mesh.primitive_ico_sphere_add(subdivisions=4)
    obj = bpy.context.active_object
    bpy.ops.object.shade_smooth()
    bpy.ops.object.modifier_add(type='SUBSURF')
    bpy.context.object.modifiers["Subdivision"].levels = 2

    # enter edit mode
    bpy.ops.object.mode_set(mode='EDIT')

    # deselect faces
    bpy.ops.mesh.select_mode(type='FACE')
    bpy.ops.mesh.select_all(action='DESELECT')

    # iterate through faces
    ico_bmesh = bmesh.from_edit_mesh(obj.data)
    for face in ico_bmesh.faces:

        # create material
        mat = bpy.data.materials.new(name=f'face_{face.index}')

        # generate color
        red = random.random()
        green = random.random()
        blue = random.random()
        alpha = 1.0
        color = (red, green, blue, alpha)
        mat.diffuse_color = color

        # add mat to object (required to add to a bmesh face)
        obj.data.materials.append(mat)

        # assign mat to face
        obj.active_material_index = face.index
        face.select = True
        bpy.ops.object.material_slot_assign()
        face.select = False

    # return to object mode
    bpy.ops.object.editmode_toggle()


def setup_scene():
    # set up world
    color = (0, 0, 1, 1)
    world = bpy.data.worlds['World']
    world.node_tree.nodes['Background'].inputs['Color'].default_value = color

    # set up camera
    bpy.ops.object.camera_add(location=(5, 5, 5), rotation=(
        math.radians(60), 0, math.radians(135)))
    camera = bpy.context.active_object
    camera.data.lens = 250
    bpy.context.scene.camera = bpy.context.active_object

    # set up light
    bpy.ops.object.light_add(type='SUN', rotation=(
        math.radians(100), 0, math.radians(90)))
    light = bpy.context.active_object
    light.data.energy = 10


def animate():
    # animate light
    light = bpy.data.objects.get('Sun')
    light.rotation_euler[2] = 0 * math.pi
    light.keyframe_insert(data_path='rotation_euler', index=2, frame=1)
    light.rotation_euler[2] = 8 * math.pi
    light.keyframe_insert(
        data_path='rotation_euler', index=2, frame=FRAME_END)

    # animate sphere
    sphere = bpy.data.objects.get('Icosphere')
    sphere.rotation_euler[2] = 0 * math.pi
    sphere.keyframe_insert(data_path='rotation_euler', index=2, frame=1)
    sphere.rotation_euler[2] = -1 * math.pi
    sphere.keyframe_insert(
        data_path='rotation_euler', index=2, frame=FRAME_END)


def render():
    blender_utils.ui.set_view3d_shading_type('RENDERED')
    blender_utils.ui.set_view3d_persective('CAMERA')

    # set render paths
    render_dir = os.path.join(dirname, 'renders')
    os.makedirs(render_dir, exist_ok=True)
    bpy.context.scene.render.filepath = os.path.join(
        render_dir, f'render@{RENDER_SIZE_PERCENTAGE}%')

    # render image
    bpy.context.scene.render.engine = ENGINE
    bpy.context.scene.render.resolution_percentage = RENDER_SIZE_PERCENTAGE
    bpy.context.scene.render.image_settings.file_format = 'PNG'
    if RENDER_IMAGE:
        bpy.ops.render.render(write_still=True)

    # render video
    bpy.context.scene.render.fps = 60
    bpy.context.scene.frame_end = FRAME_END
    bpy.context.scene.render.frame_map_new = 200
    # This is a per frame time limit for cycles
    bpy.context.scene.cycles.time_limit = 5
    # Skip denoising which is relatively expensive for a simple render like this
    bpy.context.scene.cycles.use_denoising = False
    bpy.context.scene.render.image_settings.file_format = 'FFMPEG'
    if RENDER_ANIMATION:
        bpy.ops.render.render(animation=True)


def main():
    create_geometry()
    setup_scene()
    animate()
    render()
    blender_utils.blend_file.save(blend_file)
    print('end of script')


main()
