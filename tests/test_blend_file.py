import hashlib
import pathlib
import tempfile
import unittest

import bpy

from butils.blend_file import create_or_open, save


class TestBlendFile(unittest.TestCase):
    def setUp(self) -> None:
        super().setUp()

        # Create a temporary file for testing
        self.dir = tempfile.gettempdir()
        _, filepath = tempfile.mkstemp(suffix=".blend", dir=self.dir)
        self.filepath = pathlib.Path(filepath)
        self.filepath.unlink()

    def tearDown(self) -> None:
        super().tearDown()
        self.filepath.unlink()

    def test_create_or_open(self):
        self.assertFalse(self.filepath.exists(), "File should not exist")

        # Create the file and take a hash
        create_or_open(self.filepath)
        self.assertTrue(self.filepath.exists(), "File should exist")
        hasher = hashlib.new("sha256")
        hasher.update(self.filepath.read_bytes())
        hash1 = hasher.hexdigest()

        # Update the file.
        if bpy.context.scene and bpy.context.scene.camera:
            bpy.data.objects.remove(bpy.context.scene.camera)
            bpy.ops.wm.save_as_mainfile()
        else:
            raise AssertionError("Scene and camera should not be None")

        # Take another hash and compare.
        hasher = hashlib.new("sha256")
        hasher.update(self.filepath.read_bytes())
        hash2 = hasher.hexdigest()
        self.assertNotEqual(hash1, hash2, "Hashes should differ after save")

    def test_save(self):
        self.assertFalse(self.filepath.exists(), "File should not exist")
        save(self.filepath)
        self.assertTrue(self.filepath.exists(), "File should exist after save")
