import bpy

# bpy.types.Workspace.bl_rna.properties["type"].enum_items.keys()
# bpy.types.Area.bl_rna.properties["type"].enum_items.keys()

# Remove all workspaces except the current one
for ws in bpy.data.workspaces:
    if ws != bpy.context.workspace:
        bpy.data.batch_remove(ids=(ws,))

# ws = bpy.data.workspaces[0]
# print(ws)

bpy.ops.wm.window_new()
print(bpy.context.window.screen)
print(bpy.context.window.screen.areas)
for area in bpy.context.window.screen.areas:
    print(area.type)
    with bpy.context.temp_override(window=bpy.context.window, area=area):
        area.type = "CONSOLE"
        for _ in range(5):
            bpy.ops.wm.context_cycle_int(
                data_path="space_data.font_size", reverse=False
            )
        print("checking for existing text blocks")
        print(bpy.data.texts)
        bpy.ops.screen.area_split(direction="VERTICAL", factor=0.5)
        area.type = "TEXT_EDITOR"
        print(type(area))
        bpy.types.Area.bl_rna.properties["type"].enum_items.keys()
        # if area.type == 'VIEW_3D':
        #     bpy.ops.screen.area_close()
        # elif area.type == 'TEXT_EDITOR':
        #     bpy.ops.screen.area_close()
        # elif area.type == 'PROPERTIES':
        #     bpy.ops.screen.area_close()
        # elif area.type == 'OUTLINER':
        #     bpy.ops.screen.area_close()
        # elif area.type == 'NODE_EDITOR':
        #     bpy.ops.screen.area_close()

# bpy.ops.wm.save_mainfile(filepath="test.blend", check_existing=False)
# sleep(10)
# bpy.ops.wm.quit_blender()
#
