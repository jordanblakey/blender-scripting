import unittest
from unittest.mock import MagicMock, PropertyMock

# Attempt to import bpy, but mock it if unavailable
try:
    import bpy
except ImportError:
    bpy = MagicMock()

from butils.animation.fcurve import get_fcurve, get_fcurves

class TestFCurve(unittest.TestCase):

    def test_get_fcurve_found(self):
        # Create mock FCurve objects
        mock_fcurve1 = MagicMock(spec=bpy.types.FCurve)
        type(mock_fcurve1).data_path = PropertyMock(return_value="location")
        type(mock_fcurve1).array_index = PropertyMock(return_value=0)

        mock_fcurve2 = MagicMock(spec=bpy.types.FCurve)
        type(mock_fcurve2).data_path = PropertyMock(return_value="location")
        type(mock_fcurve2).array_index = PropertyMock(return_value=1)

        mock_fcurves_list = [mock_fcurve1, mock_fcurve2]

        # Test finding an existing fcurve
        found_fcurve = get_fcurve("location", 0, mock_fcurves_list)
        self.assertEqual(found_fcurve, mock_fcurve1)

        found_fcurve_2 = get_fcurve("location", 1, mock_fcurves_list)
        self.assertEqual(found_fcurve_2, mock_fcurve2)

    def test_get_fcurve_not_found(self):
        # Create mock FCurve objects
        mock_fcurve1 = MagicMock(spec=bpy.types.FCurve)
        type(mock_fcurve1).data_path = PropertyMock(return_value="location")
        type(mock_fcurve1).array_index = PropertyMock(return_value=0)

        mock_fcurves_list = [mock_fcurve1]

        # Test not finding an fcurve with different data_path
        found_fcurve = get_fcurve("scale", 0, mock_fcurves_list)
        self.assertIsNone(found_fcurve)

        # Test not finding an fcurve with different array_index
        found_fcurve_idx = get_fcurve("location", 1, mock_fcurves_list)
        self.assertIsNone(found_fcurve_idx)

    def test_get_fcurve_empty_list(self):
        # Test with an empty list of fcurves
        found_fcurve = get_fcurve("location", 0, [])
        self.assertIsNone(found_fcurve)

    def test_get_fcurves_mocked_bpy(self):
        # This test demonstrates the structure but will heavily rely on mocks
        # and may not fully represent real bpy behavior.
        mock_obj = MagicMock(spec=bpy.types.Object)

        # Setup the nested structure for animation_data.action.layers[0].strips[0].channelbag.fcurves
        mock_fcurves_collection = MagicMock(spec=bpy.types.ActionFCurves) # Corrected spec
        
        mock_channelbag = MagicMock()
        # Instead of making channelbag a callable, configure its fcurves attribute directly
        type(mock_channelbag).fcurves = PropertyMock(return_value=mock_fcurves_collection)

        mock_strip = MagicMock()
        # Make strips[0] return our mock_strip, which then has a channelbag attribute
        type(mock_strip).channelbag = PropertyMock(return_value=mock_channelbag)


        mock_layer = MagicMock()
        type(mock_layer).strips = PropertyMock(return_value=[mock_strip])
        
        mock_action = MagicMock()
        type(mock_action).layers = PropertyMock(return_value=[mock_layer])

        mock_animation_data = MagicMock()
        type(mock_animation_data).action = PropertyMock(return_value=mock_action)
        # Make animation_data.action_slot exist
        type(mock_animation_data).action_slot = PropertyMock(return_value=None) # Or some enum if necessary


        type(mock_obj).animation_data = PropertyMock(return_value=mock_animation_data)


        # Call the function
        try:
            result_fcurves = get_fcurves(mock_obj)
            # We expect this to "succeed" by returning our deeply mocked fcurves collection
            self.assertEqual(result_fcurves, mock_fcurves_collection)
        except TypeError as e:
            # This might still raise TypeError if the mocking isn't perfect
            # or if the function tries to use aspects of bpy we haven't mocked.
            self.fail(f"get_fcurves raised TypeError with mocks: {e}")
        except AttributeError as e:
            self.fail(f"get_fcurves raised AttributeError, check mock setup: {e}")


    def test_get_fcurves_no_animation_data(self):
        mock_obj_no_anim = MagicMock(spec=bpy.types.Object)
        type(mock_obj_no_anim).animation_data = None # Simulate no animation data
        with self.assertRaises(TypeError):
            get_fcurves(mock_obj_no_anim)

    def test_get_fcurves_no_action(self):
        mock_obj_no_action = MagicMock(spec=bpy.types.Object)
        mock_animation_data_no_action = MagicMock()
        type(mock_animation_data_no_action).action = None # Simulate animation data but no action
        type(mock_obj_no_action).animation_data = PropertyMock(return_value=mock_animation_data_no_action)
        with self.assertRaises(TypeError):
            get_fcurves(mock_obj_no_action)

if __name__ == '__main__':
    unittest.main()
