# blender-scripting

Experiments in automating Blender with Python.

## Setup Project for VSCode

```bash
# create a virtual environment
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

# Don't have to use the vscode extension, alt workflow:
blender -b -P script.py  # run in background, debug python scripts.
blender -P script.py  # Work in UI
```

```py
# Now you can get autocompletion for bpy through the fake-bpy-module-latest
import bpy
```

- `Ctrl + Shift + P`: Blender: Start
- `Ctrl + Shift + P`: Blender: Run Script (Not Run & Debug)
- `Alt + R`: Reload active text file
- `Preferences > General > Developer Extras (geometric data)`
- Use `simplescreenrecorder` to record with fast encoding system audio

Note that print statements from the script will appear in the terminal, but not from the python REPL in Blender.

https://marketplace.visualstudio.com/items/?itemName=ms-python.autopep8
https://marketplace.visualstudio.com/items/?itemName=JacquesLucke.blender-development

## Script template and background mode commands

```sh
# imports above..

################################################################################
# Set Up Script
################################################################################

# blender -b -P headless_mode.py  # debug scripts
# blender -P headless_mode.py  # work in UI

dirname = os.path.dirname(__file__)
blend_file = os.path.splitext(__file__)[0] + '.blend'

# Import custom modules
modules_path = os.path.join(dirname, '..')
if not modules_path in sys.path:
    sys.path.append(modules_path)
import blender_utils  # nopep8

blender_utils.scene.clean()
blender_utils.blend_file.create_or_open(blend_file)

################################################################################
# Start Script
################################################################################

# script logic below...
```

Debugger Example
![Debugger Example](./04_vscode_python/debugger.png)

Status Bar Config - Show Scene Details, Memory, VRAM, Animation data, etc.
![Status Bar Config - Show Scene Details, Memory, VRAM, Animation data, etc.](./04_vscode_python/status_bar_config.png)

Procedural Animation Example
![Procedural Animation Example](./08_stack_spin_animation/_renders/interface.png)

Mesh from scratch, composing and repetition
![Mesh from scratch, composing and repetition](./09_make_meshes/render.png)
