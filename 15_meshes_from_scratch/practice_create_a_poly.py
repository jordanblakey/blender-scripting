import bpy


# Create a new mesh
mesh = bpy.data.meshes.new('poly')
verts = [(1, 0, 0), (0, 1, 0), (0, 0, 0)]
faces = [(0, 1, 2)]
mesh.from_pydata(verts, [], faces)

# Delete the default cube
obj = bpy.data.objects.get('Cube')
bpy.data.objects.remove(obj)

# Create a new object
obj = bpy.data.objects.new('Poly', mesh)

# Link the object to the default collection
collection = bpy.data.collections.get('Collection')
collection.objects.link(obj)
