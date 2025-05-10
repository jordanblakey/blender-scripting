import bpy
import bmesh


obj = bpy.context.active_object
if not isinstance(obj, bpy.types.Object):
    raise TypeError()
mod = obj.modifiers.new(name='Bevel', type='BEVEL')
if isinstance(mod, bpy.types.BevelModifier):
    mod.affect = 'EDGES'
    mod.width = 0.5
obj.location = (2, 0, 0)

bpy.ops.mesh.primitive_cube_add()
obj = bpy.context.active_object
if not obj or not isinstance(obj.data, bpy.types.Mesh):
    raise TypeError()

bm: bmesh.types.BMesh = bmesh.new()
bm.from_mesh(obj.data)
bmesh.ops.bevel(
    bm,
    geom=list(bm.edges),
    offset=0.5,
    segments=1,
    affect='EDGES',
    profile=0.5
)

bm.normal_update()
bm.to_mesh(obj.data)
obj.data.update()
bm.free()
