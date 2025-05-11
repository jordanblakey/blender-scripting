import os
import sys

import bmesh
import bpy

import blender_utils

dirname = os.path.dirname(__file__)
blend_file = os.path.splitext(__file__)[0] + ".blend"

# Import custom modules
modules_path = os.path.join(dirname, "..")
if modules_path not in sys.path:
    sys.path.append(modules_path)

# method 1: using a modifier
obj = bpy.context.active_object
if not isinstance(obj, bpy.types.Object):
    raise TypeError()
mod = obj.modifiers.new(name="Bevel", type="BEVEL")
if isinstance(mod, bpy.types.BevelModifier):
    mod.affect = "EDGES"
    mod.width = 0.5
obj.location = (2, 0, 0)


# method 2: using bmesh ops (similar to modifier, but modifies actual mesh geometry)
bpy.ops.mesh.primitive_cube_add()
obj = bpy.context.active_object
if not obj or not isinstance(obj.data, bpy.types.Mesh):
    raise TypeError()

bm: bmesh.types.BMesh = bmesh.new()
bm.from_mesh(obj.data)
bmesh.ops.bevel(
    bm, geom=list(bm.edges), offset=0.5, segments=1, affect="EDGES", profile=0.5
)

bm.normal_update()
bm.to_mesh(obj.data)
obj.data.update()
bm.free()
obj.location = (0, 2, 0)

# method 3: using a context manager
bpy.ops.mesh.primitive_cube_add()
obj = bpy.context.active_object
if not obj or not isinstance(obj.data, bpy.types.Mesh):
    raise TypeError()
with blender_utils.mesh.get_bmesh(obj) as bm:
    bmesh.ops.bevel(bm, geom=list(bm.edges), offset=0.5, segments=1)
