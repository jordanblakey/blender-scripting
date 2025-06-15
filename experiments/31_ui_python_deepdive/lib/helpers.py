import bpy


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


# Create scripting window
def create_scripting_window():
    def increase_font_size(n):
        for _ in range(n):
            bpy.ops.wm.context_cycle_int(
                data_path="space_data.font_size", reverse=False
            )

    bpy.ops.wm.window_new()
    for area in bpy.context.window.screen.areas:
        with bpy.context.temp_override(window=bpy.context.window, area=area):
            area.type = "CONSOLE"
            increase_font_size(4)
            bpy.ops.screen.area_split(direction="VERTICAL", factor=0.5)
            area.type = "INFO"
            bpy.ops.screen.area_split(direction="HORIZONTAL", factor=0.3)
            area.type = "TEXT_EDITOR"
            increase_font_size(4)
            bpy.data.texts.new(name="test_text")
            area.spaces.active.text = bpy.data.texts["test_text"]
