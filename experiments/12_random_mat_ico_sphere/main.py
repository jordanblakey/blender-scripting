import colorsys
import math
import os
import random
import sys

import bmesh
import bpy

import butils

ENGINE = "BLENDER_EEVEE_NEXT"
RESOLUTION_PERCENTAGE = 200
RENDER_IMAGE = True
RENDER_ANIMATION = True

################################################################################
# Set Up Script
################################################################################

# blender -b -P headless_mode.py  # debug scripts
# blender -P headless_mode.py  # work in UI

dirname = os.path.dirname(__file__)
blend_file = os.path.splitext(__file__)[0] + ".blend"

# Import custom modules
modules_path = os.path.join(dirname, "..")
if modules_path not in sys.path:
    sys.path.append(modules_path)

butils.blend_file.create_or_open(blend_file)
butils.scene.clean()

################################################################################
# Start Script
################################################################################


def create_geometry():
    # add ico sphere
    bpy.ops.mesh.primitive_ico_sphere_add(subdivisions=4)
    obj = bpy.context.active_object
    bpy.ops.object.shade_smooth()
    bpy.ops.object.modifier_add(type="SUBSURF")
    bpy.context.object.modifiers["Subdivision"].levels = 2

    # enter edit mode
    bpy.ops.object.mode_set(mode="EDIT")

    # deselect faces
    bpy.ops.mesh.select_mode(type="FACE")
    bpy.ops.mesh.select_all(action="DESELECT")

    # generate materials (1 for every 25 polygons)
    count = int(len(obj.data.polygons) / 25)
    materials = []
    for i in range(count):
        # create material
        mat = bpy.data.materials.new(name=f"random_mat_{i}")

        # generate color
        hue = random.random()
        lightness = 0.5
        rgb = colorsys.hls_to_rgb(hue, lightness, 1.0)
        alpha = 1.0
        mat.diffuse_color = (*rgb, alpha)
        mat.metallic = 0.5
        mat.roughness = 0.25

        materials.append(mat)

    # iterate through faces
    ico_bmesh = bmesh.from_edit_mesh(obj.data)
    for face in ico_bmesh.faces:
        # pick a random mat
        mat = random.choice(materials)

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
    world = bpy.data.worlds["World"]
    world.node_tree.nodes["Background"].inputs["Color"].default_value = color

    # set up camera
    bpy.ops.object.camera_add(
        location=(5, 5, 5), rotation=(math.radians(60), 0, math.radians(135))
    )
    camera = bpy.context.active_object
    camera.data.lens = 250
    bpy.context.scene.camera = bpy.context.active_object

    # set up light
    bpy.ops.object.light_add(
        type="SUN", rotation=(math.radians(100), 0, math.radians(90))
    )
    light = bpy.context.active_object
    light.data.energy = 10


def animate():
    bpy.context.scene.frame_end = 250

    # animate light
    light = bpy.data.objects.get("Sun")
    light.rotation_euler[2] = 0 * math.pi
    light.keyframe_insert(data_path="rotation_euler", index=2, frame=1)
    light.rotation_euler[2] = 8 * math.pi
    light.keyframe_insert(
        data_path="rotation_euler", index=2, frame=bpy.context.scene.frame_end
    )

    # animate sphere
    sphere = bpy.data.objects.get("Icosphere")
    sphere.rotation_euler[2] = 0 * math.pi
    sphere.keyframe_insert(data_path="rotation_euler", index=2, frame=1)
    sphere.rotation_euler[2] = -1 * math.pi
    sphere.keyframe_insert(
        data_path="rotation_euler", index=2, frame=bpy.context.scene.frame_end
    )


def main():
    create_geometry()
    setup_scene()
    animate()


main()
butils.blend_file.save(blend_file)
butils.render(
    cwd=dirname,
    engine=ENGINE,
    resolution_percentage=RESOLUTION_PERCENTAGE,
    image=RENDER_IMAGE,
    animation=RENDER_ANIMATION,
)

print("reached end of script")
