import bpy
import sys
import os

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


# add ico sphere
bpy.ops.mesh.primitive_ico_sphere_add()

# enter edit mode
bpy.ops.object.mode_set(mode='EDIT')

# deselect faces
# get geometric data from mesh
# iterate through faces
# generate color
# create a new mat
# add mat
# set active mat
# select face and assign mat
# turn off edit mode

# blender_utils.blend_file.save(blend_file)

print('end of script')
