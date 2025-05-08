import bpy


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
