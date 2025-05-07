import os
import bpy
import mathutils
import math

GRID_SIZE = 2
RENDER_SIZE = 2160
USE_CYCLES = False


def create_blend_file() -> None:
    path, file = os.path.split(__file__)
    blend_file = os.path.join(path, os.path.splitext(file)[0] + '.blend')
    bpy.ops.wm.save_mainfile(filepath=blend_file)


def clean_scene():
    bpy.ops.object.select_all(action="SELECT")
    bpy.ops.object.delete()
    bpy.ops.outliner.orphans_purge(
        do_local_ids=True, do_linked_ids=True, do_recursive=True)


def create_geometry(loc, rot):
    mesh = bpy.data.meshes.new('mesh')
    verts = [(0.0, 0.0, 0.0), (1.0, 0.0, 0.0), (1.0, 1.0, 0.0),
             (0.0, 1.0, 0.0), (0.5, 0.5, 1.0)]
    faces = [(0, 1, 2, 3), (0, 1, 4), (1, 2, 4), (2, 3, 4), (0, 3, 4)]
    mesh.from_pydata(verts, [], faces)
    obj = bpy.data.objects.new('obj', mesh)
    obj.location = mathutils.Vector(loc)
    obj.rotation_euler = mathutils.Vector(rot)
    bpy.context.collection.objects.link(obj)


def create_matrix(size, rot, offset_x=0, offset_y=0, layer_z=0):
    for x in range(size):
        for y in range(size):
            create_geometry((x + offset_x, y + offset_y, layer_z), rot)


def create_layer(size, layer_z):
    for x in range(size):
        for y in range(size):
            create_matrix(size,
                          rot=(0, 0, 0),
                          offset_x=x*(size+1),
                          offset_y=y * (size + 1),
                          layer_z=layer_z * 2)
            create_matrix(size,
                          rot=(0, math.pi, 0),
                          offset_x=1 + x * (size + 1),
                          offset_y=y * (size + 1),
                          layer_z=layer_z * 2)


def setup_scene():

    # set up camera
    bpy.ops.object.camera_add(
        location=(14, 14, 17), rotation=(math.pi / 4, 0, 3 * math.pi / 4))

    # set up light
    bpy.data.worlds["World"].node_tree.nodes["Background"].inputs['Color'].default_value = (
        0.03, 0.02, 0.05, 1)
    bpy.ops.object.light_add(type="SUN", location=(
        0, 0, 10), rotation=(0, math.pi / 4, 5 * math.pi / 3))
    light = bpy.context.active_object
    light.data.color = (1, .5, 0)
    light.data.energy = 2
    light.data.angle = (2 * math.pi / 360) * 50

    # render settings
    scene = bpy.context.scene
    scene.render.resolution_x = int(RENDER_SIZE * 16 / 9)
    scene.render.resolution_y = RENDER_SIZE
    scene.render.filepath = os.path.dirname(__file__) + '/render'
    if USE_CYCLES:
        scene.render.engine = 'CYCLES'
        scene.cycles.device = 'GPU'
        scene.cycles.adaptive_threshhold = 0.2
    else:
        scene.render.engine = 'BLENDER_EEVEE_NEXT'


def main():
    create_blend_file()
    clean_scene()

    for z in range(GRID_SIZE):
        create_layer(GRID_SIZE, z)

    setup_scene()
    print('rendering...')
    bpy.ops.render.render(write_still=True)

    print('reached end of script!')


main()
