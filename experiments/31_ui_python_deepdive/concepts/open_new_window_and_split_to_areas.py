import bpy

# bpy.types.Area.bl_rna.properties["type"].enum_items.keys()


def main():
    # Remove all workspaces except the current one
    for ws in bpy.data.workspaces:
        if ws != bpy.context.workspace:
            bpy.data.batch_remove(ids=(ws,))

    bpy.ops.wm.window_new()
    bpy.context.space_data
    for area in bpy.context.window.screen.areas:
        with bpy.context.temp_override(window=bpy.context.window, area=area):
            # open a console and make the font big
            area.type = "CONSOLE"
            increase_font_size(8)

            bpy.ops.screen.area_split(direction="VERTICAL", factor=0.5)
            # split the area and change the type to info
            area.type = "INFO"

            # split the area and change the type to text e
            bpy.ops.screen.area_split(direction="HORIZONTAL", factor=0.3)
            area.type = "TEXT_EDITOR"

            increase_font_size(8)

            # note that we can look for existing text blocks in the blender file
            bpy.data.texts.new(name="test_text")
            # and set the text block to the current text editor
            area.spaces.active.text = bpy.data.texts["test_text"]
            # set the text editor to a specific text block
            bpy.ops.text.insert(
                text="print('Hello, World! This is a test text block.')"
            )
            bpy.ops.text.run_script()


def increase_font_size(n):
    for _ in range(n):
        bpy.ops.wm.context_cycle_int(
            data_path="space_data.font_size", reverse=False
        )


if __name__ == "__main__":
    main()
