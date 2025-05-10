import contextlib

import bpy
import bmesh


@contextlib.contextmanager
def get_bmesh(obj: bpy.types.Object):
    # create the bmesh from obj.data
    bm = bmesh.new()
    if not isinstance(obj.data, bpy.types.Mesh):
        raise TypeError()
    bm.from_mesh(obj.data)
    yield bm

    # clean up
    bm.normal_update()
    bm.to_mesh(obj.data)
    obj.data.update()
    bm.free()
