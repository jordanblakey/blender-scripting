import os
import sys

import bpy

import butils

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


butils.scene.clean()
butils.blend_file.create_or_open(blend_file)

################################################################################
# Start Script
################################################################################

bpy.ops.mesh.primitive_ico_sphere_add()
ico_sphere = bpy.context.active_object
print(ico_sphere)
for name in dir(ico_sphere):
    print(name, getattr(ico_sphere, name))

print("end of script")
