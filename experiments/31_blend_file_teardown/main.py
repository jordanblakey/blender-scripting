import bpy

# Remove all workspaces except the current one
for ws in bpy.data.workspaces:
    if ws != bpy.context.workspace:
        bpy.data.batch_remove(ids=(ws,))

bpy.data.workspaces


# for window in bpy.context.window_manager.windows:
#     print(window)
#     print(window.screen)
#     print(window.screen.name)
#     print(window.screen.areas)
# for area in window.screen.areas:
# with bpy.context.temp_override(window=window, area=area):
#     bpy.ops.screen.area_close()
# print("area.type", area.type)
# print(area.regions)
# for region in area.regions:
#     print(region, region.type)
# print(area.spaces)
# for space in area.spaces:
#     print(space, space.type)
# break


# with bpy.context.temp_override(window=bpy.context.window):
#     bpy.ops.screen.area_close(area=area)

# area = bpy.context.screen.areas[0]
# print(area.type)
# bpy.ops.screen.area_close("INVOKE_DEFAULT", area=area)


# bpy.ops.workspace.append_activate(
#     idname="Scripting", filepath="<startup.blend>"
# )
# ws = [ws for ws in bpy.data.workspaces if ws.name.startswith("Scripting")]
# ws = ws.pop()

# bpy.context.
# bpy.context.workspace.name = "Main"

# append a known default workspace to start from, delete all others
# bpy.ops.workspace.append_activate(
#     idname="Scripting", filepath="<startup.blend>"
# )
# bpy.context.workspace.name = "Main"
# bpy.data.batch_remove(ws for ws in bpy.data.workspaces if ws.name != "Main")

# save the blend file
bpy.ops.wm.save_mainfile(filepath="test.blend", check_existing=False)
