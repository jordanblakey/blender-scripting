import bpy
import os
import time

# bookmark globals
window = bpy.context.window_manager.windows[0]
world = bpy.data.worlds[0]
scene = bpy.data.scenes[0]
clipboard = bpy.context.window_manager.clipboard
camera = scene.camera


def set_view_persective(perspective='CAMERA'):
    # set the window layout
    window.workspace = bpy.data.workspaces['Layout']
    for area in window.screen.areas:
        if area.type == 'VIEW_3D':
            break
    for space in area.spaces:
        if space.type == 'VIEW_3D':
            break

    # ['PERSP', 'ORTHO', 'CAMERA']
    space.region_3d.view_perspective = perspective


def render():
    renders_dir = os.path.join(os.path.dirname(__file__), '_renders')
    os.makedirs(renders_dir, exist_ok=True)

    # render viewport in perspective mode
    scene.render.filepath = os.path.join(renders_dir, 'persp_viewport')
    set_view_persective('PERSP')
    bpy.ops.render.opengl(write_still=True, view_context=True)

    # render viewport in orthographic mode
    scene.render.filepath = os.path.join(renders_dir, 'ortho_viewport')
    set_view_persective('ORTHO')
    bpy.ops.render.opengl(write_still=True, view_context=True)

    # render viewport in camera mode
    scene.render.filepath = os.path.join(renders_dir, 'camera_viewport')
    set_view_persective('CAMERA')
    bpy.ops.render.opengl(write_still=True, view_context=True)

    # render camera view
    scene.render.filepath = os.path.join(renders_dir, 'camera_view')
    bpy.ops.render.render(write_still=True)


def main():
    bpy.ops.wm.save_as_mainfile(
        filepath=os.path.splitext(__file__)[0] + '.blend')

    render()

    print('end')


main()
