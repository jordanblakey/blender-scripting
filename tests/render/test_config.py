import unittest
from unittest.mock import patch, MagicMock, PropertyMock
import os # For path manipulations if needed by mocks

# Attempt to import bpy, but mock it if unavailable
try:
    import bpy
    bpy_available = True
except ImportError:
    bpy = MagicMock()
    bpy_available = False

# Modules to test
from butils.render.config import config_render_paths, config_engine

@patch('butils.render.config.bpy', bpy) # Ensure our mocked bpy is used
class TestRenderConfig(unittest.TestCase):

    def setUp(self):
        # Create a mock for bpy.context.scene and its attributes
        self.mock_scene = MagicMock(spec=bpy.types.Scene if bpy_available else object)
        self.mock_render = MagicMock(spec=bpy.types.RenderSettings if bpy_available else object)
        self.mock_cycles = MagicMock(spec=bpy.types.CyclesRenderSettings if bpy_available else object)

        # Attach mocks to a mock context object
        # type(bpy.context) is used to mock bpy.context itself if it's a class/module
        # If bpy.context is just an object, then we patch its 'scene' attribute.
        # For simplicity, assuming bpy.context can be patched directly or its 'scene' attribute.
        
        # Patching bpy.context.scene directly
        self.context_patcher = patch.object(bpy, 'context', MagicMock())
        self.mock_context = self.context_patcher.start()
        type(self.mock_context).scene = PropertyMock(return_value=self.mock_scene)
        
        type(self.mock_scene).render = PropertyMock(return_value=self.mock_render)
        type(self.mock_scene).cycles = PropertyMock(return_value=self.mock_cycles)
        
        # Reset filepath for each test if it's set
        if hasattr(self.mock_render, 'filepath'):
            del self.mock_render.filepath
        if hasattr(self.mock_render, 'engine'):
            del self.mock_render.engine
        if hasattr(self.mock_cycles, 'time_limit'):
            del self.mock_cycles.time_limit
        if hasattr(self.mock_cycles, 'use_denoising'):
            del self.mock_cycles.use_denoising


    def tearDown(self):
        self.context_patcher.stop()

    @patch('butils.render.config.os.makedirs')
    @patch('butils.render.config.os.path.join', side_effect=lambda *args: "/".join(args))
    def test_config_render_paths_basic(self, mock_join, mock_makedirs):
        # type(self.mock_scene).render = self.mock_render # Ensure render attribute exists
        
        config_render_paths(cwd="/test/cwd", filename="myrender")
        
        mock_makedirs.assert_called_once_with("/test/cwd/renders", exist_ok=True)
        # Expected: /test/cwd/renders/myrender
        self.assertEqual(self.mock_render.filepath, "/test/cwd/renders/myrender")

    @patch('butils.render.config.os.makedirs')
    @patch('butils.render.config.os.path.join', side_effect=lambda *args: "/".join(args))
    def test_config_render_paths_with_resolution(self, mock_join, mock_makedirs):
        config_render_paths(cwd="/test/cwd", filename="myrender", resolution_percentage=50)
        mock_makedirs.assert_called_once_with("/test/cwd/renders", exist_ok=True)
        # Expected: /test/cwd/renders/myrender@50
        self.assertEqual(self.mock_render.filepath, "/test/cwd/renders/myrender@50")

    @patch('butils.render.config.os.makedirs')
    @patch('butils.render.config.os.path.join', side_effect=lambda *args: "/".join(args))
    def test_config_render_paths_anim(self, mock_join, mock_makedirs):
        config_render_paths(cwd="/test/cwd", filename="myanim_is_anim", resolution_percentage=75)
        mock_makedirs.assert_called_once_with("/test/cwd/renders", exist_ok=True)
        # Expected: /test/cwd/renders/myanim_is_anim@75_
        self.assertEqual(self.mock_render.filepath, "/test/cwd/renders/myanim_is_anim@75_")
    
    @patch('butils.render.config.os.makedirs')
    @patch('butils.render.config.os.path.join', side_effect=lambda *args: "/".join(args))
    def test_config_render_paths_anim_no_res(self, mock_join, mock_makedirs):
        config_render_paths(cwd="/test/cwd", filename="myanim_is_anim")
        mock_makedirs.assert_called_once_with("/test/cwd/renders", exist_ok=True)
        # Expected: /test/cwd/renders/myanim_is_anim_
        self.assertEqual(self.mock_render.filepath, "/test/cwd/renders/myanim_is_anim_")

    def test_config_render_paths_no_scene(self):
        # Simulate bpy.context.scene being None or not a Scene instance
        # To do this, we make the PropertyMock for scene return something else, or None
        with patch.object(bpy.context, 'scene', new_callable=PropertyMock) as mock_scene_prop:
            mock_scene_prop.return_value = None # Or MagicMock(spec=object) if strict type check
            with self.assertRaises(TypeError):
                config_render_paths(cwd="/test/cwd", filename="myrender")
            
            mock_scene_prop.return_value = MagicMock(spec=object) # Not a bpy.types.Scene
            with self.assertRaises(TypeError): # Assuming the function checks isinstance(bpy.context.scene, Scene)
                 config_render_paths(cwd="/test/cwd", filename="myrender")


    def test_config_engine_cycles(self):
        config_engine(engine="CYCLES", time_limit=10, use_denoising=True)
        self.assertEqual(self.mock_render.engine, "CYCLES")
        self.assertEqual(self.mock_cycles.time_limit, 10)
        self.assertEqual(self.mock_cycles.use_denoising, True)

    def test_config_engine_eevee_next(self):
        config_engine(engine="BLENDER_EEVEE_NEXT")
        self.assertEqual(self.mock_render.engine, "BLENDER_EEVEE_NEXT")
        # Ensure cycles settings are not touched for EEVEE
        self.assertFalse(hasattr(self.mock_cycles, 'time_limit') or self.mock_cycles.time_limit == 0) # Check if set or default
        self.assertFalse(hasattr(self.mock_cycles, 'use_denoising') or not self.mock_cycles.use_denoising)


    def test_config_engine_workbench(self):
        config_engine(engine="WORKBENCH")
        self.assertEqual(self.mock_render.engine, "WORKBENCH")

    def test_config_engine_no_scene(self):
        with patch.object(bpy.context, 'scene', new_callable=PropertyMock) as mock_scene_prop:
            mock_scene_prop.return_value = None
            with self.assertRaises(TypeError):
                config_engine(engine="CYCLES")

            mock_scene_prop.return_value = MagicMock(spec=object) # Not a bpy.types.Scene
            with self.assertRaises(TypeError):
                 config_engine(engine="CYCLES")


if __name__ == '__main__':
    unittest.main()
