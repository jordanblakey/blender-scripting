import bpy


def main():
    # clear workspaces to start from a clean slate
    remove_other_workspaces()

    # save the blend file
    bpy.ops.wm.save_mainfile(filepath="test.blend", check_existing=False)

    # create a text editor area and load an external script
    area = get_area("VIEW_3D")
    with bpy.context.temp_override(area=area):
        bpy.ops.screen.area_split(direction="VERTICAL", factor=0.5)
        area.type = "TEXT_EDITOR"
        bpy.ops.text.open(
            filepath="./script_to_run_in_blender.py", internal=True
        )
        # run the script from the text editor
        # note that this is running a script against an already open blend file.
        # This could be useful to load scripts into a blend file that can then be run after working in the file.
        # For example, a script that finds and select objects with high polygon counts.
        # Or a script that identifies objects that are never visible to the scene camera.
        # Or a script that programmatically sets up the scene for rendering.
        # Or a script that performs some repetitive transformation after an object has been modeled by hand.
        bpy.ops.text.run_script()

    # change the properties area's context to RENDER
    area = get_area("PROPERTIES")
    with bpy.context.temp_override(area=area):
        space = get_space(area, "PROPERTIES")
        print("Properties space:", space)
        space.context = "RENDER"
        # Confirm that the render engine is set to CYCLES by the external script we loaded.


def get_area(area_type):
    for area in bpy.context.window.screen.areas:
        if area.type == area_type:
            return area


def get_space(area, space_type):
    for space in area.spaces:
        if space.type == space_type:
            return space


# Remove all workspaces except the current one
def remove_other_workspaces():
    current_workspace = bpy.context.workspace
    for ws in bpy.data.workspaces:
        if ws != current_workspace:
            bpy.data.batch_remove(ids=(ws,))


if __name__ == "__main__":
    main()
