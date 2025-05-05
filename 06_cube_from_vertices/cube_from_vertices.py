import bpy
import itertools
import os

# Open corresponding .blend file
path, file = os.path.split(__file__)
blend_file = os.path.splitext(file)[0] + '.blend'
blend_file_path = os.path.join(path, blend_file)
bpy.ops.wm.open_mainfile(filepath=os.path.join(path, blend_file))

# Delete all objects from scene
for obj in bpy.context.scene.objects:
    bpy.data.objects.remove(obj)

# set the view_rotation for the view_3d area
for window in bpy.context.window_manager.windows:
    for area in window.screen.areas:
        if area.type == 'VIEW_3D':
            for space in area.spaces:
                if space.type == 'VIEW_3D':
                    space.region_3d.view_rotation = (
                        0.8001, 0.4619, -0.1913, -0.3314)


# create a cube
# create geometric data
verts = sorted(itertools.product([0, 1], repeat=3))
faces = [
    (0, 1, 3, 2),
    (0, 2, 6, 4),
    (0, 4, 5, 1),
    (1, 3, 7, 5),
    (7, 3, 2, 6),
    (4, 5, 7, 6),
]
edges = []

# create a mesh and add data
mesh_data = bpy.data.meshes.new('cube_data')
mesh_data.from_pydata(verts, edges, faces)

# create an object and add the mesh to it
mesh_obj = bpy.data.objects.new('cube_object', mesh_data)
bpy.context.collection.objects.link(mesh_obj)


# create a pyramid
# create geometric data
verts = [
    (0, 0, 0),
    (1, 0, 0),
    (1, 1, 0),
    (0, 1, 0),
    (0.5, 0.5, 1)]
faces = [
    (0, 1, 4),
    (1, 2, 4),
    (2, 3, 4),
    (3, 0, 4),
    (0, 1, 2, 3)]

# create a mesh and add data
mesh_data = bpy.data.meshes.new('pyramid_data')
mesh_data.from_pydata(verts, [], faces)

# create an object and and the mesh to it
mesh_obj = bpy.data.objects.new('pyramid_object', mesh_data)
bpy.context.collection.objects.link(mesh_obj)

# move it away from the origin a bit
mesh_obj.location.x = -1
mesh_obj.location.y = -1
