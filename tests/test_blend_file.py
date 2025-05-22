import os  # Added for os.path.getmtime for comparison if needed, or for general file operations
import pathlib
import tempfile
import time
import unittest
from ast import Assert
from venv import create

import bpy

from butils.blend_file import create_or_open, save


class TestBlendFile(unittest.TestCase):
    def setUp(self) -> None:
        super().setUp()
        # Create a temporary file for testing
        self.dir = tempfile.gettempdir()
        _, filepath = tempfile.mkstemp(suffix=".blend", dir=self.dir)
        filepath = pathlib.Path(filepath)
        filepath.unlink()
        self.filepath = filepath

    def tearDown(self) -> None:
        super().tearDown()
        # Ensure the temporary file is deleted after the test
        if self.filepath.exists():
            self.filepath.unlink()

    def test_create_or_open(self):
        self.assertFalse(
            self.filepath.exists(), "File should not exist at start"
        )

        create_or_open(self.filepath)
        self.assertTrue(
            self.filepath.exists(), "File should exist after create_or_open"
        )
        mtime_after_create = self.filepath.stat().st_mtime
        self.assertGreater(
            mtime_after_create, 0, "Modification time should be valid"
        )

        # Update the file.
        if bpy.context.scene and bpy.context.scene.camera:
            bpy.data.objects.remove(bpy.context.scene.camera)
            bpy.ops.wm.save_as_mainfile()
        else:
            raise AssertionError("Scene and camera should not be None")

        create_or_open(self.filepath)
        self.assertTrue(self.filepath.exists(), "File should still exist")
        mtime_after_second_call = self.filepath.stat().st_mtime
        time.sleep(0.01)
        self.assertGreater(
            mtime_after_second_call,
            mtime_after_create,
            "Modification time should update after subsequent save",
        )

        # Check the file is created if it doesn't exist.
        self.filepath.unlink()
        self.assertFalse(self.filepath.exists(), "File should be deleted")
        create_or_open(self.filepath)
        self.assertTrue(self.filepath.exists(), "File should be recreated")

    def test_save(self):
        self.assertFalse(
            self.filepath.exists(),
            "File should not exist at start of save test",
        )
        save(self.filepath)
        self.assertTrue(self.filepath.exists(), "File should exist after save")
