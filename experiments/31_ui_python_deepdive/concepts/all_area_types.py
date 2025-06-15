import bpy

window = bpy.context.window_manager.windows[0]


def main():
    close_all_areas(window)  # for area in window.screen.areas:
    n = 9
    with bpy.context.temp_override(window=window, area=window.screen.areas[0]):
        for i in range(n - 1):
            bpy.ops.screen.area_split(
                factor=1 / (n - i), direction="HORIZONTAL"
            )

    with bpy.context.temp_override(window=window, area=window.screen.areas[0]):
        for j in range(n - 1):
            bpy.ops.screen.area_split(factor=1 / (n - j), direction="VERTICAL")

    area_types = bpy.types.Area.bl_rna.properties["type"].enum_items.keys()
    area_types = list(
        filter(
            lambda type: type not in ["EMPTY", "TOPBAR", "STATUSBAR"],
            area_types,
        )
    )

    print(area_types)
    for i in range(len(window.screen.areas)):
        print(area_types[i % len(area_types)])
        window.screen.areas[i].type = area_types[i % len(area_types)]


def close_all_areas(window):
    for area in window.screen.areas[1:]:
        with bpy.context.temp_override(window=window, area=area):
            bpy.ops.screen.area_close()


if __name__ == "__main__":
    main()


################################################################################

# # force the region to redraw, and give the refresh time
# bpy.ops.wm.redraw_timer(type="DRAW", iterations=1)
# # force the window to redraw, and give the refresh time
# bpy.ops.wm.redraw_timer(type="DRAW_WIN_SWAP", iterations=1)

# bpy.data.texts.new("split_horizontally")
# bpy.data.texts["split_horizontally"].write(
#     "import bpy\nbpy.ops.screen.area_split(direction='HORIZONTAL')"
# )
# bpy.data.texts.new("split_vertically")
# bpy.data.texts["split_vertically"].write(
#     "import bpy\nbpy.ops.screen.area_split(direction='VERTICAL')"
# )
