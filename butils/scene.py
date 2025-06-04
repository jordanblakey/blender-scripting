import bpy
from bpy.types import (
    Object,
    ShaderNodeTree,
    TrackToConstraint,
    ViewLayer,
)


def clean(
    unhide_objects: bool = True,
    delete_objects: bool = True,
    purge_orphans: bool = True,
    reset_worlds: bool = True,
) -> None:
    """
    Deep clean the scene to an empty state. Skip steps if desired.
    """
    scene = bpy.context.scene

    if unhide_objects:
        for obj in bpy.data.objects:
            obj.hide_set(False)
            obj.hide_select = False
            obj.hide_viewport = False
            obj.hide_render = False
    if delete_objects:
        if not scene:
            raise TypeError()
        for collection in scene.collection.children:
            bpy.data.collections.remove(collection)
        for obj in scene.collection.objects:
            bpy.data.objects.remove(obj)
        collection = bpy.data.collections.new("Collection")
        scene.collection.children.link(collection)
        set_active_collection(collection.name)

    if purge_orphans:
        bpy.ops.outliner.orphans_purge(
            do_local_ids=True, do_linked_ids=True, do_recursive=True
        )

    if reset_worlds:
        world_names = [world.name for world in bpy.data.worlds]
        for name in world_names:
            bpy.data.worlds.remove(bpy.data.worlds[name])
        bpy.ops.world.new()
        if not scene:
            raise TypeError()
        scene.world = bpy.data.worlds["World"]

    print("finished cleaning scene.")


def set_active_collection(name, parent=None):
    """
    Set the active collection by name.
    """
    if not isinstance(bpy.context.view_layer, ViewLayer):
        raise TypeError()
    if parent is None:
        parent = bpy.context.view_layer.layer_collection
    for layer_collection in parent.children:
        if layer_collection.name == name:
            bpy.context.view_layer.active_layer_collection = layer_collection
            return True
        if set_active_collection(name, layer_collection):
            return True
    return False


def setup_starter_scene(background_color=(0.0, 0.0, 0.0, 1.0), lens=55):
    """
    Set up a basic scene from the blank state produced by the "clean" function.
    """
    # set up world
    world = bpy.data.worlds["World"]

    if not isinstance(world.node_tree, ShaderNodeTree):
        raise TypeError()
    background_node = world.node_tree.nodes["Background"]
    setattr(background_node.inputs["Color"], "default_value", background_color)

    # set up camera
    bpy.ops.object.camera_add(location=(5, 5, 5))
    camera = bpy.context.active_object
    if not camera or not bpy.context.scene:
        raise TypeError()
    setattr(camera.data, "lens", 55)
    bpy.context.scene.camera = bpy.context.active_object

    # set up camera tracking
    bpy.ops.object.empty_add()
    empty_obj = bpy.context.active_object
    if not isinstance(empty_obj, Object):
        raise TypeError()
    empty_obj.name = "CameraTrackEmpty"
    track_to_constraint = camera.constraints.new(type="TRACK_TO")
    if not isinstance(track_to_constraint, TrackToConstraint):
        raise TypeError()
    track_to_constraint.target = empty_obj

    # set up light
    bpy.ops.object.light_add(type="SUN", rotation=(0, 0, 0))
    light = bpy.context.active_object
    if light and light.data and hasattr(light.data, "energy"):
        setattr(light.data, "energy", 10)
