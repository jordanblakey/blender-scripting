import math
import os
import sys

import bmesh
import bpy

ENGINE = "BLENDER_EEVEE_NEXT"
RESOLUTION_PERCENTAGE = 200
RENDER_IMAGE = False
RENDER_ANIMATION = False
RENDER_VIEWPORT = True

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
import butils  # nopep8

butils.scene.clean()
butils.blend_file.create_or_open(blend_file)

################################################################################
# Define Functions
################################################################################


def create_circle(vert_count=16, radius=1, z=0):
    # init params
    angle_step = math.tau / vert_count

    # create an empty object
    bpy.ops.object.add(type="MESH")
    obj = bpy.context.active_object
    mesh = obj.data
    bm = bmesh.new()

    # create the vertices
    for i in range(vert_count):
        # calc coords
        theta = i * angle_step
        x = radius * math.cos(theta)
        y = radius * math.sin(theta)

        bm.verts.new((x, y, z))

    # finalize bmesh data
    bm.faces.new(bm.verts)
    bm.to_mesh(mesh)
    bm.free()


def create_obj_spiral(obj_count=16, radius=1, offset=1):
    angle_step = math.tau / obj_count
    for i in range(obj_count * 2):
        theta = i * angle_step
        x = radius * math.cos(theta)
        y = radius * math.sin(theta)

        bpy.ops.mesh.primitive_ico_sphere_add(
            radius=0.1, location=(x, y, 2 + offset * i)
        )


################################################################################
# Compose Functions
################################################################################


def main():
    create_circle(radius=1, z=0)
    create_circle(radius=2, z=-3)
    create_obj_spiral(radius=1, offset=0.1)
    create_obj_spiral(radius=3, offset=0)
    create_obj_spiral(radius=4, offset=0)
    bpy.ops.object.light_add(type="SUN")


################################################################################
# Run Script, Save .blend File, Render
################################################################################


print("script stage starting...")
main()
print("script stage complete.")

butils.blend_file.save(blend_file)

print("render stage starting...")
butils.ui.set_view_location(location=(0, 0, 0))
butils.render.quick_render(
    cwd=dirname,
    viewport=True,
    resolution_percentage=RESOLUTION_PERCENTAGE,
    shading_type="RENDERED",
    view3d_perspective="ORTHO",
)
print("render stage complete.")
