import os
import sys
import bpy


# identify the source and symlink path
try:
    source_path = os.path.abspath(os.path.dirname(str(__file__)))
    symlink_path = os.path.join(bpy.utils.user_resource('SCRIPTS'), 'modules')
except AttributeError:
    print('Run this script in Blender, e.g. `$ blender --background --python install_symlink.py`')
    sys.exit()

# create the symlink
stdout = os.popen(f'ln -s {source_path} {symlink_path}').read()
print(stdout)

# check creation was successful
check_path = os.path.join(symlink_path, 'blender_utils')
check = os.path.exists(check_path)
print(f'Symbolic link is installed: {check}')
if not check:
    raise FileNotFoundError('Failed to create symbolic link.')

# check import is working
try:
    import blender_utils  # nopep8
    print('You can now use `import blender_utils` as normal.')
except ModuleNotFoundError as err:
    print(err)
    print('Importing blender_utils failed after successful symlink creation.')
