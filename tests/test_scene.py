import unittest
from unittest.mock import patch, MagicMock, PropertyMock, call

# Attempt to import bpy, but mock it if unavailable
try:
    import bpy
    bpy_types = bpy.types
except ImportError:
    bpy = MagicMock()
    # Define mock types for isinstance checks if bpy is not available
    class Mockbpy_types:
        Object = MagicMock
        Scene = MagicMock
        ViewLayer = MagicMock
        LayerCollection = MagicMock
        Collection = MagicMock
        World = MagicMock
        ShaderNodeTree = MagicMock
        Node = MagicMock
        NodeInputs = MagicMock
        Constraint = MagicMock
        TrackToConstraint = MagicMock
        Camera = MagicMock
        Light = MagicMock

    bpy_types = Mockbpy_types()
    bpy.types = Mockbpy_types() # Make bpy.types.Scene etc. work


# Import functions to test
from butils.scene import clean, set_active_collection, setup_starter_scene

@patch('butils.scene.bpy', bpy) # Ensure our mocked bpy is used throughout
class TestScene(unittest.TestCase):

    def setUp(self):
        # Mock common bpy structures
        self.mock_context = MagicMock()
        type(bpy).context = PropertyMock(return_value=self.mock_context)

        self.mock_scene = MagicMock(spec=bpy_types.Scene)
        type(self.mock_context).scene = PropertyMock(return_value=self.mock_scene)
        self.mock_scene.name = "TestScene"
        self.mock_scene.collection = MagicMock(spec=bpy_types.Collection)
        self.mock_scene.collection.children = []
        self.mock_scene.collection.objects = []

        self.mock_data = MagicMock()
        type(bpy).data = PropertyMock(return_value=self.mock_data)
        self.mock_data.objects = []
        self.mock_data.collections = MagicMock() # Make it a mock to give it methods
        self.mock_data.worlds = []
        
        self.mock_ops = MagicMock()
        type(bpy).ops = PropertyMock(return_value=self.mock_ops)
        self.mock_ops.outliner.orphans_purge = MagicMock()
        self.mock_ops.world.new = MagicMock()
        self.mock_ops.object.camera_add = MagicMock()
        self.mock_ops.object.empty_add = MagicMock()
        self.mock_ops.object.light_add = MagicMock()

        self.mock_view_layer = MagicMock(spec=bpy_types.ViewLayer)
        type(self.mock_context).view_layer = PropertyMock(return_value=self.mock_view_layer)
        self.mock_layer_collection = MagicMock(spec=bpy_types.LayerCollection)
        type(self.mock_view_layer).layer_collection = PropertyMock(return_value=self.mock_layer_collection)
        type(self.mock_view_layer).active_layer_collection = PropertyMock(return_value=self.mock_layer_collection)


    @patch('butils.scene.set_active_collection') # Mock internal call within clean
    @patch('builtins.print')
    def test_clean_all_options(self, mock_print, mock_set_active_coll):
        # Setup for unhide_objects
        mock_obj1 = MagicMock(spec=bpy_types.Object)
        mock_obj2 = MagicMock(spec=bpy_types.Object)
        self.mock_data.objects = [mock_obj1, mock_obj2]

        # Setup for delete_objects
        mock_child_coll = MagicMock(spec=bpy_types.Collection)
        self.mock_scene.collection.children = [mock_child_coll]
        mock_scene_obj = MagicMock(spec=bpy_types.Object)
        self.mock_scene.collection.objects = [mock_scene_obj]
        
        mock_new_coll = MagicMock(spec=bpy_types.Collection)
        mock_new_coll.name = "NewCollection"
        self.mock_data.collections.new = MagicMock(return_value=mock_new_coll)
        self.mock_scene.collection.children.link = MagicMock()


        # Setup for reset_worlds
        mock_world1 = MagicMock(spec=bpy_types.World, name="World1")
        mock_world2 = MagicMock(spec=bpy_types.World, name="World2")
        self.mock_data.worlds = {"World1": mock_world1, "World2": mock_world2}.values() # Make it iterable
        # Mock dictionary-like access for worlds
        self.mock_data.worlds.__getitem__ = lambda _, key: {"World1": mock_world1, "World2": mock_world2, "World": MagicMock(name="World")}[key]


        clean(unhide_objects=True, delete_objects=True, purge_orphans=True, reset_worlds=True)

        # Assertions for unhide_objects
        for mock_obj in self.mock_data.objects:
            mock_obj.hide_set.assert_called_once_with(False)
            self.assertEqual(mock_obj.hide_select, False)
            self.assertEqual(mock_obj.hide_viewport, False)
            self.assertEqual(mock_obj.hide_render, False)
        
        # Assertions for delete_objects
        self.mock_data.collections.remove.assert_called_once_with(mock_child_coll)
        self.mock_data.objects.remove.assert_called_once_with(mock_scene_obj) # Assuming self.mock_data.objects is also the global one
        self.mock_data.collections.new.assert_called_once_with("Collection")
        self.mock_scene.collection.children.link.assert_called_once_with(mock_new_coll)
        mock_set_active_coll.assert_called_once_with(mock_new_coll.name)

        # Assertions for purge_orphans
        self.mock_ops.outliner.orphans_purge.assert_called_once_with(do_local_ids=True, do_linked_ids=True, do_recursive=True)
        
        # Assertions for reset_worlds
        self.assertEqual(self.mock_data.worlds.remove.call_count, 2) # Should be called for World1 and World2
        self.mock_ops.world.new.assert_called_once()
        self.assertTrue(hasattr(self.mock_scene, 'world'))


        mock_print.assert_called_once_with("finished cleaning scene.")


    def test_clean_type_errors(self):
        original_scene = bpy.context.scene
        try:
            # Test TypeError for delete_objects
            type(bpy.context).scene = PropertyMock(return_value=MagicMock(spec=object)) # Not a Scene
            with self.assertRaises(TypeError):
                clean(delete_objects=True, unhide_objects=False, purge_orphans=False, reset_worlds=False)
            
            # Reset scene for next test
            type(bpy.context).scene = PropertyMock(return_value=original_scene)
            
            # Test TypeError for reset_worlds
            type(bpy.context).scene = PropertyMock(return_value=MagicMock(spec=object)) # Not a Scene
            self.mock_data.worlds = {} # Ensure it passes the first part
            with self.assertRaises(TypeError):
                clean(delete_objects=False, unhide_objects=False, purge_orphans=False, reset_worlds=True)
        finally:
            type(bpy.context).scene = PropertyMock(return_value=original_scene) # Restore


    def test_set_active_collection_found_top_level(self):
        mock_coll1_layer = MagicMock(spec=bpy_types.LayerCollection, name="Collection1")
        mock_coll2_layer = MagicMock(spec=bpy_types.LayerCollection, name="Collection2")
        self.mock_layer_collection.children = [mock_coll1_layer, mock_coll2_layer]
        
        result = set_active_collection("Collection2")
        self.assertTrue(result)
        self.assertEqual(self.mock_view_layer.active_layer_collection, mock_coll2_layer)

    def test_set_active_collection_found_nested(self):
        mock_coll1_layer = MagicMock(spec=bpy_types.LayerCollection, name="Collection1")
        mock_coll1_layer.children = [] # No children itself initially for simplicity of this branch
        mock_coll2_layer = MagicMock(spec=bpy_types.LayerCollection, name="Collection2")
        mock_coll2_child_layer = MagicMock(spec=bpy_types.LayerCollection, name="NestedCollection")
        mock_coll2_layer.children = [mock_coll2_child_layer]
        
        self.mock_layer_collection.children = [mock_coll1_layer, mock_coll2_layer]
        
        result = set_active_collection("NestedCollection")
        self.assertTrue(result)
        self.assertEqual(self.mock_view_layer.active_layer_collection, mock_coll2_child_layer)

    def test_set_active_collection_not_found(self):
        mock_coll1_layer = MagicMock(spec=bpy_types.LayerCollection, name="Collection1")
        mock_coll1_layer.children = []
        self.mock_layer_collection.children = [mock_coll1_layer]
        
        result = set_active_collection("NonExistentCollection")
        self.assertFalse(result)

    def test_set_active_collection_type_error(self):
        original_view_layer = bpy.context.view_layer
        try:
            type(bpy.context).view_layer = PropertyMock(return_value=MagicMock(spec=object)) # Not a ViewLayer
            with self.assertRaises(TypeError):
                set_active_collection("AnyCollection")
        finally:
            type(bpy.context).view_layer = PropertyMock(return_value=original_view_layer)


    def test_setup_starter_scene(self):
        # Mock world setup
        mock_world = MagicMock(spec=bpy_types.World)
        mock_node_tree = MagicMock(spec=bpy_types.ShaderNodeTree)
        type(mock_world).node_tree = PropertyMock(return_value=mock_node_tree)
        mock_background_node = MagicMock(spec=bpy_types.Node)
        mock_node_tree.nodes = {"Background": mock_background_node} # Make it dict-like
        mock_background_node.inputs = {"Color": MagicMock(spec=bpy_types.NodeInputs)}
        
        # self.mock_data.worlds needs to be a dict for world['World'] access
        self.mock_data.worlds = {"World": mock_world}

        # Mock camera setup
        mock_camera_obj = MagicMock(spec=bpy_types.Object)
        mock_camera_data = MagicMock(spec=bpy_types.Camera) # bpy.types.Camera, not Object
        type(mock_camera_obj).data = PropertyMock(return_value=mock_camera_data)
        self.mock_ops.object.camera_add.return_value = None # operator itself doesn't return the obj
        type(self.mock_context).active_object = PropertyMock(return_value=mock_camera_obj)
        mock_camera_obj.constraints.new = MagicMock(return_value=MagicMock(spec=bpy_types.TrackToConstraint))
        
        # Mock empty setup
        mock_empty_obj = MagicMock(spec=bpy_types.Object)
        # self.mock_ops.object.empty_add.return_value = None # (already default)
        # active_object will be switched by ops, so we need side_effect
        def active_object_side_effect(*args, **kwargs):
            if bpy.ops.object.camera_add.called:
                return mock_camera_obj
            if bpy.ops.object.empty_add.called:
                return mock_empty_obj
            if bpy.ops.object.light_add.called:
                return mock_light_obj
            return MagicMock() # default
        
        type(self.mock_context).active_object = PropertyMock(side_effect=active_object_side_effect)


        # Mock light setup
        mock_light_obj = MagicMock(spec=bpy_types.Object)
        mock_light_data = MagicMock(spec=bpy_types.Light) # bpy.types.Light
        type(mock_light_obj).data = PropertyMock(return_value=mock_light_data)
        # self.mock_ops.object.light_add.return_value = None # (already default)

        setup_starter_scene(background_color=(0.1, 0.2, 0.3, 1.0), lens=50)

        # World assertions
        self.assertEqual(mock_background_node.inputs["Color"].default_value, (0.1, 0.2, 0.3, 1.0))
        
        # Camera assertions
        self.mock_ops.object.camera_add.assert_called_once_with(location=(5, 5, 5))
        self.assertEqual(mock_camera_data.lens, 50)
        self.assertEqual(self.mock_scene.camera, mock_camera_obj)

        # Empty and constraint assertions
        self.mock_ops.object.empty_add.assert_called_once()
        self.assertEqual(mock_empty_obj.name, "CameraTrackEmpty")
        mock_camera_obj.constraints.new.assert_called_once_with(type="TRACK_TO")
        self.assertEqual(mock_camera_obj.constraints.new.return_value.target, mock_empty_obj)

        # Light assertions
        self.mock_ops.object.light_add.assert_called_once_with(type="SUN", rotation=(0,0,0))
        self.assertEqual(mock_light_data.energy, 10)

    # Add more tests for TypeErrors in setup_starter_scene if time permits
    # e.g., world.node_tree not being ShaderNodeTree, camera or empty not being Object, etc.

if __name__ == '__main__':
    unittest.main()
