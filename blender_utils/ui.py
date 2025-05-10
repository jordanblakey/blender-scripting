import bpy
import mathutils
import math


def get_context(name):
    '''
    Gets context for overrides

    Example Usage:
    context = blender_utils.ui.get_context('VIEW_3D')
    with bpy.context.temp_override(**context):
        bpy.ops.object.select_all(action='SELECT')
    '''
    for window in bpy.context.window_manager.windows:
        for area in window.screen.areas:
            if area.type == name:
                for region in area.regions:
                    if region.type == 'WINDOW':
                        context = {
                            'window': window,
                            'screen': window.screen,
                            'area': area,
                            'region': region
                        }
                        return context
    raise ValueError('Couldn\'t find context for ' + name)


def set_view3d_shading_type(shading_type='RENDERED'):
    # Set view3d shading type to one of 'WIREFRAME', 'SOLID', 'PREVIEW', 'RENDERED'.
    for area in bpy.context.screen.areas:
        if area.type == 'VIEW_3D':
            for space in area.spaces:
                if space.type == 'VIEW_3D':
                    space.shading.type = shading_type
                    return True
    return False


def set_view3d_persective(perspective='CAMERA'):
    # Set view3d perspective to one of 'PERSP', 'ORTHO', 'CAMERA'.
    for area in bpy.context.screen.areas:
        if area.type == 'VIEW_3D':
            for space in area.spaces:
                if space.type == 'VIEW_3D':
                    space.region_3d.view_perspective = perspective
                    return True
    return False


def set_view_location(location=(0, 0, 0), pitch=math.pi / 4, roll=0,
                      yaw=math.pi / 4):
    for area in bpy.context.screen.areas:
        if area.type == 'VIEW_3D':
            for region in area.regions:
                if region.type == 'WINDOW':
                    region.data.view_location = mathutils.Vector(location)
                    region.data.view_rotation = mathutils.Euler(
                        (pitch, roll, yaw), 'XYZ').to_quaternion()
                    return True
    return False
