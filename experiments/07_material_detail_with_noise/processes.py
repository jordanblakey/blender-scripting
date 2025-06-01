import bpy

print(bpy.data.filepath)
if "blend" in bpy.data.filepath:
    print(".blend file open")
print("test")
