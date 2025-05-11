import contextlib
from typing import Generator

import bmesh
import bpy
from bmesh.types import BMesh


@contextlib.contextmanager
def get_bmesh(obj: bpy.types.Object) -> Generator[BMesh, None, None]:
    """
    Context manager handling data sync and cleanup fo simplify bmesh workflow.

    Example Usage:
    with blender_utils.mesh.get_bmesh(obj) as bm:
        bmesh.ops.bevel(bm, geom=list(bm.edges), offset=0.5, segments=1)
    """
    # create the bmesh from obj.data
    bm: BMesh = bmesh.new()
    if not isinstance(obj.data, bpy.types.Mesh):
        raise TypeError()
    bm.from_mesh(obj.data)
    yield bm

    # clean up
    bm.normal_update()
    bm.to_mesh(obj.data)
    obj.data.update()
    bm.free()
