import math
import os
import random
import sys

import bpy

ENGINE = "BLENDER_EEVEE_NEXT"
RESOLUTION_PERCENTAGE = 200
RENDER_VIEWPORT = True
RENDER_IMAGE = False
RENDER_ANIMATION = False

# import bpy
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


def create_geometry(n=6, r=0.2, steps=36):
    step_angle = math.tau / steps

    for i in range(steps):
        # radius = random.normalvariate(mu=1, sigma=1)
        bpy.ops.mesh.primitive_circle_add(vertices=n, radius=0.1 + (i * r))
        obj = bpy.context.active_object
        obj.rotation_euler.x = math.radians(-90)
        obj.rotation_euler.z = step_angle * i

        bpy.ops.object.convert(target="CURVE")
        obj.data.bevel_depth = 0.025
        obj.data.bevel_resolution = 16
        bpy.ops.object.shade_smooth()


################################################################################
# Compose Functions
################################################################################


def main():
    create_geometry(n=6, r=0.2, steps=36)
    bpy.ops.object.light_add(type="SUN")


################################################################################
# Run Script, Save .blend File, Render
################################################################################


print("script stage starting...")
main()
print("script stage complete.")
butils.blend_file.save(blend_file)
print("render stage starting...")
butils.quick_render(
    cwd=dirname,
    engine=ENGINE,
    resolution_percentage=RESOLUTION_PERCENTAGE,
    viewport=RENDER_VIEWPORT,
    image=RENDER_IMAGE,
    animation=RENDER_ANIMATION,
)
print("render stage complete.")
