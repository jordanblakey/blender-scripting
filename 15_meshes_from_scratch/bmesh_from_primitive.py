import bpy
import bmesh

obj = bpy.context.active_object

bpy.ops.object.mode_set(mode='EDIT')
bm = bmesh.from_edit_mesh(obj.data)

selected_verts = []
for verts in bm.verts:
    if verts.select:
        selected_verts.append(verts)

for vert in selected_verts:
    print(f'{vert.index}')

bm.free()
