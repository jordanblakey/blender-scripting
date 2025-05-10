import bpy
import math

# Create a new mesh
mesh = bpy.data.meshes.new('poly')
verts = [(1, 0, 0), (0, 1, 0), (0, 0, 0)]
faces = [(0, 1, 2)]
mesh.from_pydata(verts, [], faces)

# Delete the default cube
obj = bpy.data.objects.get('Cube')
bpy.data.objects.remove(obj)


def create_circle(steps=16, radius=1, location=(0, 0, 0), rotation=(0, 0, 0)):
    # create mesh
    mesh = bpy.data.meshes.new('circle')
    verts = []

    # create vertices
    for i in (range(steps)):
        angle_step = math.tau / steps
        theta = angle_step * i
        x = radius * math.cos(theta)
        y = radius * math.sin(theta)
        verts.append((x, y, 0))

    # create face
    edges = []
    for i in range(steps):
        edges.append((i, (i + 1) % steps))

    mesh.from_pydata(verts, edges, [])

    # create object
    obj = bpy.data.objects.new('Circle', mesh)
    collection = bpy.data.collections.get('Collection')
    collection.objects.link(obj)

    # position object
    obj.location = location
    obj.rotation_euler = rotation


def main():
    create_circle(32, 1, (0, 0, 0), (math.radians(90), 0, 0))
    create_circle(32, 1, (0, 0, 0), (0, math.radians(90), 0))


main()
