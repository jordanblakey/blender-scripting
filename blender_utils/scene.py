import bpy


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
