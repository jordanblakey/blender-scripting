import os
import sys

sys.path.append(os.path.dirname(__file__))

import functools

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
        # bpy.ops.screen.animation_play()
        print(
            "bpy.context.screen.is_animation_playing",
            bpy.context.screen.is_animation_playing,
        )
        bpy.app.timers.register(
            lambda: print("Timer callback executed"), first_interval=5.0
        )

        add_cubes()
        print("this happens immediately")
        bpy.app.timers.register(
            lambda: None if bpy.ops.screen.animation_cancel() else None,
            first_interval=5,
        )
        step()
        bpy.app.timers.register(frame_jump_start, first_interval=10)
        bpy.app.timers.register(frame_jump_end, first_interval=12)


def frame_jump_start():
    """Jump to the end of the current frame range."""
    bpy.ops.screen.frame_jump(end=False)
    print("Jumped to the start of the frame range.")


def frame_jump_end():
    """Jump to the end of the current frame range."""
    bpy.ops.screen.frame_jump(end=True)
    print("Jumped to the end of the frame range.")


def step(x=0):
    """This function is called every 5 seconds."""
    print("Step function called")
    bpy.ops.screen.frame_offset(delta=10)
    x += 1
    if x < 5:
        # Run step() after 5 seconds
        bpy.app.timers.register(functools.partial(step, x), first_interval=1)


# Add 10 cubes in 10 seconds
def add_cubes(x=0):
    bpy.ops.mesh.primitive_cube_add(location=(x, x, 0))
    x += 2
    if x < 10:  # Run add_cubes(x) after 1 second
        bpy.app.timers.register(
            functools.partial(add_cubes, x), first_interval=1
        )


add_cubes()


if __name__ == "__main__":
    main()
