import bpy


def main():
    remove_other_workspaces()
    # Split each of these areas into 9 sub-areas
    for name in ["PROPERTIES", "VIEW_3D", "OUTLINER"]:
        area = get_area(name)
        with bpy.context.temp_override(area=area):
            for _ in range(4):
                bpy.ops.screen.area_split(direction="VERTICAL")
                bpy.ops.screen.area_split(direction="HORIZONTAL")


# Get the area by name
def get_area(name):
    for area in bpy.context.window.screen.areas:
        if area.type == name:
            return area


# Remove all workspaces except the current one
def remove_other_workspaces():
    current_workspace = bpy.context.workspace
    for ws in bpy.data.workspaces:
        if ws != current_workspace:
            bpy.data.batch_remove(ids=(ws,))


if __name__ == "__main__":
    main()
