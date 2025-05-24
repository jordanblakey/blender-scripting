import unittest
from unittest.mock import MagicMock, PropertyMock, patch

# Attempt to import bpy, but mock it if unavailable
try:
    import bpy
except ImportError:
    bpy = MagicMock()

# Import functions to test
from butils.animation.keyframe import (
    insert_keyframe,
    get_keyframe,
    edit_keyframe,
    delete_keyframe,
)

# Mock butils.animation.fcurve functions as they are bpy dependent and tested separately
mock_butils_get_fcurves = MagicMock()
mock_butils_get_fcurve = MagicMock()

@patch('butils.animation.get_fcurves', mock_butils_get_fcurves)
@patch('butils.animation.get_fcurve', mock_butils_get_fcurve)
class TestKeyframe(unittest.TestCase):

    def setUp(self):
        # Reset mocks before each test to ensure test isolation
        mock_butils_get_fcurves.reset_mock()
        mock_butils_get_fcurve.reset_mock()

        # Common mock objects
        self.mock_obj = MagicMock(spec=bpy.types.Object)
        self.mock_fcurves = MagicMock(spec=bpy.types.ActionFCurves) # Corrected spec
        self.mock_fcurve = MagicMock(spec=bpy.types.FCurve)
        self.mock_keyframe_point = MagicMock(spec=bpy.types.Keyframe)
        
        # Setup return values for fcurve functions
        mock_butils_get_fcurves.return_value = self.mock_fcurves
        mock_butils_get_fcurve.return_value = self.mock_fcurve

        # Setup keyframe_points on the mock_fcurve
        type(self.mock_fcurve).keyframe_points = PropertyMock(return_value=[self.mock_keyframe_point])
        
        # Setup keyframe coordinates
        # To simulate keyframe.co.x and keyframe.co.y, we need a mock for 'co' attribute
        mock_co = MagicMock()
        mock_co.x = 10 # Example frame number
        mock_co.y = 5.0 # Example value
        type(self.mock_keyframe_point).co = PropertyMock(return_value=mock_co)


    def test_get_keyframe_found(self):
        mock_co_data = MagicMock()
        mock_co_data.x = 10
        type(self.mock_keyframe_point).co = mock_co_data # Make sure .co.x can be accessed

        kf = get_keyframe(self.mock_obj, "location", frame=10, index=0)
        
        mock_butils_get_fcurves.assert_called_once_with(self.mock_obj)
        mock_butils_get_fcurve.assert_called_once_with("location", 0, self.mock_fcurves)
        self.assertEqual(kf, self.mock_keyframe_point)

    def test_get_keyframe_not_found_fcurve_missing(self):
        mock_butils_get_fcurve.return_value = None # Simulate fcurve not found
        
        kf = get_keyframe(self.mock_obj, "location", frame=10, index=0)
        
        self.assertIsNone(kf)
        mock_butils_get_fcurves.assert_called_once_with(self.mock_obj)
        mock_butils_get_fcurve.assert_called_once_with("location", 0, self.mock_fcurves)

    def test_get_keyframe_not_found_keyframe_missing(self):
        mock_co_data = MagicMock()
        mock_co_data.x = 20 # Different frame
        type(self.mock_keyframe_point).co = mock_co_data

        kf = get_keyframe(self.mock_obj, "location", frame=10, index=0) # Looking for frame 10
        
        self.assertIsNone(kf)

    def test_insert_keyframe_success(self):
        # Mock obj.keyframe_insert
        self.mock_obj.keyframe_insert = MagicMock()

        # For the get_keyframe call within insert_keyframe to succeed
        mock_co_data = MagicMock()
        mock_co_data.x = 10 # Frame we are inserting
        type(self.mock_keyframe_point).co = mock_co_data
        
        # Mock keyframe attributes that will be set
        type(self.mock_keyframe_point).interpolation = PropertyMock(side_effect=lambda x: setattr(self.mock_keyframe_point, '_interpolation', x))
        type(self.mock_keyframe_point).easing = PropertyMock(side_effect=lambda x: setattr(self.mock_keyframe_point, '_easing', x))
        # self.mock_keyframe_point.co.y can be set directly if co is a MagicMock not a PropertyMock returning a static val
        type(self.mock_keyframe_point).co = MagicMock()
        self.mock_keyframe_point.co.x = 10 # Ensure frame matches for retrieval
        
        kf = insert_keyframe(self.mock_obj, "location", frame=10, index=0, value=2.0, easing="AUTO", interpolation="BEZIER")

        self.mock_obj.keyframe_insert.assert_called_once_with("location", index=0, frame=10)
        self.assertEqual(kf, self.mock_keyframe_point)
        self.assertEqual(self.mock_keyframe_point.co.y, 2.0)
        # For attributes set via property mocks with side_effect:
        # self.assertEqual(self.mock_keyframe_point._interpolation, "BEZIER")
        # self.assertEqual(self.mock_keyframe_point._easing, "AUTO")
        # Or check that the property was set
        self.assertEqual(self.mock_keyframe_point.interpolation, "BEZIER")
        self.assertEqual(self.mock_keyframe_point.easing, "AUTO")


    def test_insert_keyframe_fail_to_get_keyframe(self):
        self.mock_obj.keyframe_insert = MagicMock()
        
        # Simulate get_keyframe returning None after insert
        with patch('butils.animation.keyframe.get_keyframe', MagicMock(return_value=None)) as mock_internal_get_keyframe:
            with self.assertRaises(ValueError) as context:
                insert_keyframe(self.mock_obj, "location", frame=10)
            self.assertEqual(str(context.exception), "Failed to insert keyframe.")
            mock_internal_get_keyframe.assert_called_once()


    def test_edit_keyframe_success(self):
        # Re-setup co for direct assignment
        self.mock_keyframe_point.co = MagicMock()
        self.mock_keyframe_point.co.y = 0.0 # Initial value
        
        # Setup properties for assignment checking
        # It's simpler to just let MagicMock handle these attributes directly
        # self.mock_keyframe_point.interpolation = "CONSTANT" 
        # self.mock_keyframe_point.easing = "LINEAR"

        result = edit_keyframe(self.mock_keyframe_point, value=5.0, easing="AUTO", interpolation="BEZIER")

        self.assertTrue(result)
        self.assertEqual(self.mock_keyframe_point.co.y, 5.0)
        self.assertEqual(self.mock_keyframe_point.interpolation, "BEZIER")
        self.assertEqual(self.mock_keyframe_point.easing, "AUTO")

    def test_edit_keyframe_no_keyframe(self):
        result = edit_keyframe(None, value=5.0)
        self.assertFalse(result)

    def test_delete_keyframe_success(self):
        # Mock fcurves.keyframe_delete (assuming fcurves is the collection, not fcurve single)
        self.mock_fcurves.keyframe_delete = MagicMock()
        
        result = delete_keyframe(self.mock_obj, "location", frame=10, index=0)

        self.assertTrue(result)
        mock_butils_get_fcurves.assert_called_once_with(self.mock_obj)
        mock_butils_get_fcurve.assert_called_once_with("location", 0, self.mock_fcurves)
        self.mock_fcurves.keyframe_delete.assert_called_once_with("location", index=0, frame=10)

    def test_delete_keyframe_fcurve_not_found(self):
        mock_butils_get_fcurve.return_value = None # Simulate fcurve not found
        
        result = delete_keyframe(self.mock_obj, "location", frame=10, index=0)
        
        self.assertFalse(result) # Or check specific return value if defined for this case
        mock_butils_get_fcurves.assert_called_once_with(self.mock_obj)
        mock_butils_get_fcurve.assert_called_once_with("location", 0, self.mock_fcurves)
        self.mock_fcurves.keyframe_delete.assert_not_called()

if __name__ == '__main__':
    unittest.main()
