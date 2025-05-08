import os
import bpy


def create_or_open(blend_file):
    if bpy.context.blend_data.filepath:
        print('opened existing .blend file.')
    elif os.path.exists(blend_file):
        print('.blend file exists, opening...')
        save(blend_file)
    else:
        print('.blend file does not exist, creating...')
        save(blend_file)


def save(blend_file):
    bpy.ops.wm.save_as_mainfile(filepath=blend_file)
