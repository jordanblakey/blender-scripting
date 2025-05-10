import bpy
import math


def clean(
        unhide_objects=True,
        delete_objects=True,
        purge_orphans=True,
        reset_worlds=True):

    if unhide_objects:
        for obj in bpy.data.objects:
            obj.hide_set(False)
            obj.hide_select = False
            obj.hide_viewport = False
            obj.hide_render = False

    if delete_objects:
        scene = bpy.context.scene
        for collection in scene.collection.children:
            bpy.data.collections.remove(collection)
        for obj in scene.collection.objects:
            bpy.data.objects.remove(obj)
        collection = bpy.data.collections.new('Collection')
        scene.collection.children.link(collection)
        set_active_collection(collection.name)

    if purge_orphans:
        bpy.ops.outliner.orphans_purge(
            do_local_ids=True, do_linked_ids=True, do_recursive=True)

    if reset_worlds:
        world_names = [world.name for world in bpy.data.worlds]
        for name in world_names:
            bpy.data.worlds.remove(bpy.data.worlds[name])
        bpy.ops.world.new()
        bpy.context.scene.world = bpy.data.worlds['World']

    print('finished cleaning scene.')


def set_active_collection(name, parent=None):
    if parent is None:
        parent = bpy.context.view_layer.layer_collection
    for layer_collection in parent.children:
        if layer_collection.name == name:
            bpy.context.view_layer.active_layer_collection = layer_collection
            return True
        if set_active_collection(name, layer_collection):
            return True
    return False


def setup_starter_scene(background_color=(0, 0, 0, 1), lens=55):
    # set up world
    world = bpy.data.worlds['World']
    world.node_tree.nodes['Background'].inputs['Color'].default_value = background_color

    # set up camera
    bpy.ops.object.camera_add(location=(5, 5, 5))
    camera = bpy.context.active_object
    camera.data.lens = lens
    bpy.context.scene.camera = bpy.context.active_object

    # set up camera tracking
    bpy.ops.object.empty_add()
    empty_obj = bpy.context.active_object
    empty_obj.name = "CameraTrackEmpty"
    track_to_constraint = camera.constraints.new(type='TRACK_TO')
    track_to_constraint.target = empty_obj

    # set up light
    bpy.ops.object.light_add(type='SUN', rotation=(0, 0, 0))
    light = bpy.context.active_object
    light.data.energy = 10
