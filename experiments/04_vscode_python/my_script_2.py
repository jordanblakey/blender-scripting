import bpy

bpy.ops.mesh.primitive_cube_add(
    size=4,
    enter_editmode=False,
    align="WORLD",
    location=(0, 0, 0),
    scale=(1, 1, 1),
    rotation=(0, 0, 0),
)
cube_obj = bpy.context.active_object
print("test2")

cube_obj.location.x = 5
cube_obj.location.y = 5
cube_obj.location.z = 5
