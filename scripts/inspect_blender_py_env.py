#!/usr/bin/env python3
"""inspect the blender python environment and print useful information."""

import sys

import bpy


def main():
    """inspect the blender environment and print useful information."""
    # this is blender's python
    print("sys.executable:", sys.executable)
    # this is where modules should be installed
    print("bpy.utils.script_path_user()", bpy.utils.script_path_user())
    # lots of useful information about the application env
    print("bpy.app.binary_path:", getattr(bpy.app, "binary_path"))
    print("bpy.app.background:", getattr(bpy.app, "background"))
    print("bpy.app.debug:", getattr(bpy.app, "debug"))
    print("bpy.app.factory_startup:", getattr(bpy.app, "factory_startup"))
    print("bpy.app.tempdir:", getattr(bpy.app, "tempdir"))
    print("bpy.app.version:", getattr(bpy.app, "version"))


if __name__ == "__main__":
    if not hasattr(bpy, "app"):
        raise RuntimeError("Script should run in Blender's Python env.")
    else:
        main()
