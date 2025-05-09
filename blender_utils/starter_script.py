import bpy
import sys
import os

ENGINE = 'BLENDER_EEVEE_NEXT'
RESOLUTION_PERCENTAGE = 200
RENDER_IMAGE = False
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

blender_utils.scene.clean()
blender_utils.blend_file.create_or_open(blend_file)

################################################################################
# Define Script
################################################################################


def main():
    pass


################################################################################
# Run Script, Save .blend File, Render
################################################################################

print('script stage starting...')
main()
print('script stage complete.')
blender_utils.blend_file.save(blend_file)
print('render stage starting...')
blender_utils.render(
    cwd=dirname,
    engine=ENGINE,
    resolution_percentage=RESOLUTION_PERCENTAGE,
    image=RENDER_IMAGE,
    animation=RENDER_ANIMATION)
print('render stage complete.')
