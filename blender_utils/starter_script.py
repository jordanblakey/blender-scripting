import os
import sys
from pathlib import Path

import bmesh
import bpy

import blender_utils

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

dirname: os.PathLike = Path(os.path.dirname(__file__))
blend_file: os.PathLike = Path(os.path.splitext(__file__)[0] + ".blend")
blender_utils.scene.clean()
blender_utils.blend_file.create_or_open(blend_file)

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
# Compose Functions
################################################################################


def main():
    add_vertex()


################################################################################
# Run Script, Save .blend File, Render
################################################################################

print("script stage starting...")
main()
print("script stage complete.")
blender_utils.blend_file.save(blend_file)
print("render stage starting...")
blender_utils.render.quick_render(
    cwd=dirname,
    engine=ENGINE,
    resolution_percentage=RESOLUTION_PERCENTAGE,
    viewport=RENDER_VIEWPORT,
    image=RENDER_IMAGE,
    animation=RENDER_ANIMATION,
)
print("render stage complete.")
