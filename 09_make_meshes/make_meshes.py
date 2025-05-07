import os
import bpy
import mathutils
import math


def create_blend_file() -> None:
    path, file = os.path.split(__file__)
    blend_file = os.path.join(path, os.path.splitext(file)[0] + '.blend')
    bpy.ops.wm.save_mainfile(filepath=blend_file)


def clean_scene():
    bpy.ops.object.select_all(action="SELECT")
    bpy.ops.object.delete()
    bpy.ops.outliner.orphans_purge(
        do_local_ids=True, do_linked_ids=True, do_recursive=True)


def create_geometry(loc, rot):
    mesh = bpy.data.meshes.new('mesh')
    verts, edges, faces = [], [], []
    verts.append((0.0, 0.0, 0.0))
    verts.append((1.0, 0.0, 0.0))
    verts.append((1.0, 1.0, 0.0))
    verts.append((0.0, 1.0, 0.0))
    verts.append((0.5, 0.5, 1.0))
    faces.append((0, 1, 2, 3))
    faces.append((0, 1, 4))
    faces.append((1, 2, 4))
    faces.append((2, 3, 4))
    faces.append((0, 3, 4))
    mesh.from_pydata(verts, edges, faces)
    obj = bpy.data.objects.new('obj', mesh)
    obj.location = mathutils.Vector(loc)
    obj.rotation_euler = mathutils.Vector(rot)
    bpy.context.collection.objects.link(obj)

    # mesh = bpy.data.meshes.new('mesh')
    # print(mesh)
    # mesh.vertices.add(2)
    # v1 = mathutils.Vector()
    # v1.x = 0.0
    # v1.y = 0.0
    # v1.z = 1.0
    # v2 = mathutils.Vector((1.0, 1.0, 1.0))
    # mesh.vertices[0].co = v1
    # mesh.vertices[1].co = v2
    # mesh.edges.add(1)

    # # Create an edge
    # edge = mesh.edges[0]
    # edge.vertices[0] = 0
    # edge.vertices[1] = 1

    # # Create a face
    # mesh.vertices.add(1)
    # mesh.vertices[2].co = (0.0, 1.0, 0.0)

    # mesh.edges.add(2)
    # mesh.edges[1].vertices[0] = 1
    # mesh.edges[1].vertices[1] = 2

    # mesh.edges[2].vertices[0] = 2
    # mesh.edges[2].vertices[1] = 0

    # obj = bpy.data.objects.new('obj', mesh)
    # bpy.context.collection.objects.link(obj)
    # # for vertex in mesh.vertices:

    # for vertex in mesh.vertices:
    #     print(vertex, vertex.co)

    # mesh.polygons.add(1)
    # print(mesh.polygons[0])

    # bpy.context.view_layer.objects.active = obj
    # bpy.ops.object.editmode_toggle()
    # bpy.ops.mesh.select_all(action='SELECT')
    pass


def create_matrix(size, rot, offset_x=0, offset_y=0, layer_z=0):
    for x in range(size):
        for y in range(size):
            create_geometry((x + offset_x, y + offset_y, layer_z), rot)


def create_layer(size, layer_z):
    for x in range(size):
        for y in range(size):
            create_matrix(size, (0, 0, 0), offset_x=x*(size+1),
                          offset_y=y * (size + 1), layer_z=layer_z * 2)
            create_matrix(size, (0, math.pi, 0), offset_x=1 +
                          x * (size + 1), offset_y=y * (size + 1), layer_z=layer_z * 2)


def main():
    create_blend_file()
    clean_scene()
    for z in range(2):
        create_layer(2, z)

    print('reached end of script!')


main()
