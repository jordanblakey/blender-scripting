import importlib
import importlib.machinery
import os
import sys
from importlib.util import find_spec

import bpy

# identify the source and symlink path
try:
    source_path: str = os.path.abspath(os.path.dirname(str(__file__)))
    symlink_path: str = os.path.join(
        bpy.utils.user_resource("SCRIPTS"), "modules"
    )
except AttributeError:
    print("Run with: `$ blender --background --python install_symlink.py`")
    sys.exit()

# create the symlink
stdout: str = os.popen(f"ln -s {source_path} {symlink_path}").read()

# check creation was successful
check_path: str = os.path.join(symlink_path, "blender_utils")
check: bool = os.path.exists(check_path)
print(f"Symbolic link is installed: {check}")
if not check:
    raise FileNotFoundError("Failed to create symbolic link.")

print(find_spec("blender_utils"))


# check import is working
importlib.invalidate_caches()
if isinstance(find_spec("blender_utils"), importlib.machinery.ModuleSpec):
    print("You can now use `import blender_utils` as normal.")
else:
    raise ModuleNotFoundError(
        "Importing blender_utils failed after successful symlink creation."
    )
