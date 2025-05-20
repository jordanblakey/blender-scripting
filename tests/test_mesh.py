import unittest

import bmesh
import bpy
from mathutils import Vector

from butils import (
    mesh,
    scene,
)


class TestGetBMesh(unittest.TestCase):
    def setUp(self):
        """
        Set up a clean scene and add a default cube before each test.
        """
        # Use the clean function from butils.scene
        # This ensures a consistent state for each test
        scene.clean()

        # Add a simple object (e.g., a cube) to test with
        bpy.ops.mesh.primitive_cube_add(
            size=2, enter_editmode=False, align="WORLD", location=(0, 0, 0)
        )
        self.obj = bpy.context.object
        self.assertIsNotNone(self.obj, "Failed to create cube object")
        if self.obj:
            self.assertEqual(
                self.obj.type, "MESH", "Created object is not a mesh"
            )

    def tearDown(self):
        """
        Clean up the scene after each test.
        """
        # Use the clean function from butils.scene
        scene.clean()

    def test_get_bmesh_provides_bmesh_object(self):
        """
        Tests that get_bmesh context manager yields a BMesh object.
        """
        self.assertIsNotNone(self.obj, "Cube object not created")
        if self.obj:
            with mesh.get_bmesh(self.obj) as bm:
                self.assertIsInstance(
                    bm,
                    bmesh.types.BMesh,
                    "Context manager did not return a BMesh",
                )

    def test_get_bmesh_syncs_changes_back(self):
        """
        Tests that changes made to the BMesh are synced back to the object's mesh data.
        """
        if not isinstance(self.obj, bpy.types.Object) or not isinstance(
            self.obj.data, bpy.types.Mesh
        ):
            self.fail("Cube object not created")

        # Get the initial location of a vertex
        initial_vertex_count = len(self.obj.data.vertices)
        self.assertGreater(initial_vertex_count, 0, "Cube should have vertices")

        # Choose a vertex to modify (e.g., the first one)
        vertex_index_to_modify = 0
        original_co = self.obj.data.vertices[vertex_index_to_modify].co.copy()
        move_vector = Vector((1.0, 2.0, 3.0))
        expected_co = original_co + move_vector

        with mesh.get_bmesh(self.obj) as bm:
            # Find the corresponding vertex in the bmesh
            self.assertGreater(
                len(bm.verts),
                vertex_index_to_modify,
                "BMesh should have enough vertices",
            )
            bm.verts.ensure_lookup_table()
            v = bm.verts[vertex_index_to_modify]

            # Modify the vertex coordinate in the bmesh
            v.co += move_vector

            # Assert the change within the bmesh context
            self.assertEqual(
                v.co, expected_co, "Vertex coordinate not updated in bmesh"
            )

        # After the context manager exits, the changes should be synced back
        # Re-access the vertex from the object's mesh data
        # Ensure data is updated, though get_bmesh should handle this
        self.obj.data.update()
        updated_co = self.obj.data.vertices[vertex_index_to_modify].co

        # Assert the change in the object's mesh data (use almostEqual for floats)
        self.assertAlmostEqual(updated_co.x, expected_co.x, places=6)
        self.assertAlmostEqual(updated_co.y, expected_co.y, places=6)
        self.assertAlmostEqual(updated_co.z, expected_co.z, places=6)

    def test_get_bmesh_raises_type_error_for_non_mesh(self):
        """
        Tests that get_bmesh raises TypeError when given a non-mesh object.
        """
        # Add an empty object (which is not a mesh)
        bpy.ops.object.empty_add(type="PLAIN_AXES", location=(0, 0, 0))
        empty_obj = bpy.context.object
        if empty_obj is None:
            self.fail("Failed to create empty object")

        self.assertNotEqual(
            empty_obj.type, "MESH", "Created object should not be a mesh"
        )

        # Expect a TypeError when using get_bmesh with a non-mesh object
        with self.assertRaises(TypeError):
            with mesh.get_bmesh(empty_obj):
                # This block should not be reached if the TypeError is raised
                self.fail("TypeError was not raised for non-mesh object")

        # Clean up the empty object
        bpy.data.objects.remove(empty_obj)
