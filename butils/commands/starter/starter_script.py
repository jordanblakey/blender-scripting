import os

import bpy

import butils

ENGINE = "BLENDER_EEVEE_NEXT"
RESOLUTION_PERCENTAGE = 200
RENDER_VIEWPORT = True
RENDER_IMAGE = False
RENDER_ANIMATION = False

################################################################################
# Set Up Script
################################################################################

# blender -P headless_mode.py -b  # run without UI to debug scripts
# blender -P headless_mode.py  # run with UI to check output and work visually

dirname = os.path.dirname(__file__)
blend_file = os.path.splitext(__file__)[0] + ".blend"
butils.scene.clean()
butils.blend_file.create_or_open(blend_file)

################################################################################
# Compose Functions
################################################################################


def main():
    add_vertex()


################################################################################
# Define Functions
################################################################################


def add_vertex() -> None:
    bpy.ops.object.add(type="MESH")
    obj = bpy.context.active_object
    if not obj or not isinstance(obj.data, bpy.types.Mesh):
        raise TypeError()
    obj.data.vertices.add(1)


################################################################################
# Run Script, Save .blend File, Render
################################################################################

print("script stage starting...")
main()
print("script stage complete.")
butils.blend_file.save(blend_file)
print("render stage starting...")
butils.render.quick_render(
    cwd=dirname,
    engine=ENGINE,
    resolution_percentage=RESOLUTION_PERCENTAGE,
    viewport=RENDER_VIEWPORT,
    image=RENDER_IMAGE,
    animation=RENDER_ANIMATION,
)
print("render stage complete.")
