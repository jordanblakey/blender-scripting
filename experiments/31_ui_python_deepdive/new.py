import os
import sys

sys.path.append(os.path.dirname(__file__))

import bpy
from lib import helpers


def main():
    helpers.remove_other_workspaces()
    # helpers.create_scripting_window()
    print(bpy.context.window_manager.windows)
    main_window = bpy.context.window_manager.windows[0]

    with bpy.context.temp_override(window=main_window):
        area = helpers.get_area("VIEW_3D")
        space = helpers.get_space(area, "VIEW_3D")
        print("3D Viewport Area:", area)
        print("3D Viewport Space:", space)

        # show or hide the status bar along the very bottom of the screen
        # note that only a main window has a status bar
        bpy.context.screen.show_statusbar = True
        print(bpy.context.screen.statusbar_info())
        # print(
        #     "bpy.context.screen.is_animation_playing",
        #     bpy.context.screen.is_animation_playing,
        # )
        # time.sleep(3)
        bpy.ops.screen.animation_play()
        print(
            "bpy.context.screen.is_animation_playing",
            bpy.context.screen.is_animation_playing,
        )


if __name__ == "__main__":
    main()
