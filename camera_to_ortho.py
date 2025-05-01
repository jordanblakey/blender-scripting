#import bpy

#print(bpy.context)
#print(bpy.context.object)
#print(bpy.context.object.mode)
#bpy.ops.object.mode_set(mode='EDIT')
#print(bpy.context.object.mode)
##bpy.ops.object.select_all(action='SELECT')
##print(dir(bpy.context.object))
##print([*filter(lambda property: property.startswith('select'), dir(bpy.context.object))])

##print(bpy.context.object.select_set())
##if bp.context.object and bpy.context.object.mode != 'OBJECT'

##bpy.ops.object.mode_set(mode='OBJECT')
##bpy.ops.object.select_all(action='DESELECT')
##bpy.ops.object.select_all(action='SELECT')

##try:
##    bpy.ops.object.delete()
##    print('Cleared existing object')
##except RuntimeError as e:
##    print(f'Could not delete objects (scene might be empty): {e}')


#print(bpy.context.selected_objects)

import bpy

scene = bpy.context.scene
print(scene)

print(scene.camera)
scene.camera.data.type = 'ORTHO'

#bpy.ops.view3d.view_camera()

print(bpy.context.screen.areas)
for area in bpy.context.screen.areas:
    print(area.type)
    if area.type == 'VIEW_3D':
        for region in area.regions:
            if region.type == 'WINDOW':
                override = {
                    'screen': bpy.context.screen,
                    'area': area,
                    'region': region,
                    'scene': bpy.context.scene,
                }
                with bpy.context.temp_override(**override):
                    bpy.ops.view3d.view_camera()

