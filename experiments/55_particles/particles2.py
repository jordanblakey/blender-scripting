import bpy

print("Running particles2.py")

print(bpy)
print(bpy.context.scene)
bpy.ops.wm.save_mainfile(filepath="particles2.blend")
print("Opened blend file")
print(bpy.context.blend_data)
print(bpy.context.blend_data.objects)
print(bpy.app.version_string)

print("\n\nbpy.ops")
print(dir(bpy.ops))

print("\n\nbpy.ops.wm")
print(dir(bpy.ops.wm))

print("\n\nbpy.props")
print(bpy.props.EnumProperty)


print("\n\nbpy.path")
print(dir(bpy.path))

print("\n\nbpy.data")
print(bpy.data)

print("\n\nbpy.context")
print(bpy.context)
