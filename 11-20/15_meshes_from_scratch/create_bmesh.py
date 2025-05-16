import bpy
import bmesh
from typing import Union

scene: Union[bpy.types.Scene, None] = bpy.data.scenes.get('Scene')
# verify the type is correct. Explicit typing allows auto completion after .get
print(type(scene))
collection: Union[bpy.types.Collection,
                  None] = scene.collection.children.get('Collection')
print(type(collection))
cube: Union[bpy.types.Object, None] = bpy.data.objects.get('Cube')
print(type(cube))
collection.objects.unlink(cube)

obj_name = 'my shape'
mesh: bpy.types.Mesh = bpy.data.meshes.new(
    f'{obj_name}_mesh')
print(type(mesh))
mesh_obj: bpy.types.Object = bpy.data.objects.new(obj_name, mesh)
print(type(mesh_obj))
collection.objects.link(mesh_obj)


bm: bmesh.types.BMesh = bmesh.new()
print(type(bm))

vert_coords = [
    (1.0, 1.0, 0.0),
    (1.0, -1.0, 0.0),
    (-1.0, -1.0, 0.0),
    (-1.0, 1.0, 0.0),
    (0.0, 0.0, 1.0)
]
for coord in vert_coords:
    bm.verts.new(coord)
bm.verts.ensure_lookup_table()

# its important to check using Overlay > Face Orientation that the grey faces are on the outside of the mesh (or at least the same side if it has no inside)
# if not, reorder the vertices until the face orientation flips
face_vert_indices = [
    (0, 1, 2, 3),
    (4, 1, 0),
    (4, 2, 1),
    (4, 3, 2),
    (4, 0, 3)
]

for vert_indices in face_vert_indices:
    bm.faces.new([bm.verts[i] for i in vert_indices])


# Writes this BMesh data into an existing bpy.types.Mesh datablock
bm.to_mesh(mesh)
# Sync the scene with the Mesh data. Calculate edges.
mesh.update()
# Free the memory used to construct the bmesh. Not required.
bm.free()

print('done')
