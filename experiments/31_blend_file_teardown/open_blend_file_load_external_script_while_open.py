import bpy


def main():
    remove_other_workspaces()
    for name in ["PROPERTIES", "VIEW_3D", "OUTLINER"]:
        area = get_area(name)
        with bpy.context.temp_override(area=area):
            for _ in range(4):
                bpy.ops.screen.area_split(direction="VERTICAL")
                bpy.ops.screen.area_split(direction="HORIZONTAL")

    # # save the blend file
    # bpy.ops.wm.save_mainfile(filepath="test.blend", check_existing=False)

    # for area in bpy.context.window.screen.areas:
    #     print(area.type)
    #     if area.type == "VIEW_3D":
    #         with bpy.context.temp_override(
    #             window=bpy.context.window, area=area
    #         ):
    #             bpy.ops.screen.area_split(direction="VERTICAL", factor=0.5)
    #             area.type = "TEXT_EDITOR"
    #             bpy.ops.text.open(
    #                 filepath="./script_to_run_in_blender.py", internal=True
    #             )
    #             bpy.ops.text.run_script()

    # for area in bpy.context.window.screen.areas:
    #     if area.type == "PROPERTIES":
    #         with bpy.context.temp_override(
    #             window=bpy.context.window, area=area
    #         ):
    #             bpy.ops.screen.area_move(direction="UP")


def get_area(name):
    for area in bpy.context.window.screen.areas:
        if area.type == name:
            return area


# for window in bpy.context.window_manager.windows:
#     print(window)
#     print(window.screen)
#     print(window.screen..areas)
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


# Remove all workspaces except the current one
def remove_other_workspaces():
    current_workspace = bpy.context.workspace
    for ws in bpy.data.workspaces:
        if ws != current_workspace:
            bpy.data.batch_remove(ids=(ws,))


if __name__ == "__main__":
    main()
