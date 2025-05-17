# blender-scripting

Experiments in automating Blender with Python.

## Setup Project for VSCode

```bash
# create a virtual environment
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

# install requirements and blender_utils symlink in Blender scripts directory
# run this every requirements.txt is updated.
blender --background --python blender_utils/install_requirements.py

# run Python scripts in Blender from the CLI
blender -P headless_mode.py -b  # run without UI to debug scripts (fast)
blender -P headless_mode.py  # run with UI to check output and work visually
```

```py
# autocompletion for bpy through the fake-bpy-module-latest package
import bpy
```

## `blender_utils` module

A python module to abstract common blender scripting code.

```sh
blender_utils/
├── install_symlink.py  # run to symlink module to Blender scripts directory
├── starter_script.py  # boilerplate for scripting a blender scene
├── blend_file.py  # work with .blend files
├── scene.py  # clean scenes, work with collections
├── mesh.py  # simplify working with meshes
├── render.py  # simplify rendering viewport, stills, and animations
└── ui.py  # work with the blender ui: get contexts, control viewport
```

## Blender VS Code Extension

There is a deprecated [extension](https://marketplace.visualstudio.com/items/?itemName=JacquesLucke.blender-development), but still works to debug a blender scripts. Crashes frequently.

- `Ctrl + Shift + P`: Blender: Start
- `Ctrl + Shift + P`: Blender: Run Script (Not Run & Debug)

## Blender UI Notes

- `Alt + R`:
- `Preferences > General > Developer Extras (geometric data)`
- Use `simplescreenrecorder` to record with fast encoding system audio

Note that print statements from the script will appear in the terminal, but not from the python REPL in Blender.

## Visual Notes, Renders

| ![Parametric Modeling with Geometry Nodes](/static/images/readme/parameteric_meshes_geometry_nodes.png) |
| :-----------------------------------------------------------------------------------------------------: |
|                                 Parametric Modeling with Geometry Nodes                                 |

| ![Hard Surface Modeling](/static/images/readme/hard_surface_modeling.png) |
| :-----------------------------------------------------------------------: |
|                       Learning Hard Suface Modeling                       |

| ![Geometry Nodes](/static/images/readme/geometry_nodes_and_materials.png) |
| :-----------------------------------------------------------------------: |
|                Working with node based geometry modifiers                 |

| ![Iterative Material Experiments](/static/images/readme/iterative_material_exploration-BSDF.png) | ![Exploring Fresnel and adding bloom with the compositor](/static/images/readme/fresnel_node+bloom.png) |
| :----------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------: |
|                                  Iterative Material Experiments                                  |                       Exploring Fresnel node and adding bloom with the compositor                       |

| ![Wave Texture -> Voronoi Texture -> Displacement](/static/images/readme/materal_wave-texture_voronoi_displacement.png) |
| :---------------------------------------------------------------------------------------------------------------------: |
|                                     Wave Texture -> Voronoi Texture -> Displacement                                     |

| ![Screen1](/static/images/readme/iteration.png) | ![Screen2](/static/images/readme/iteration2.png) |
| :---------------------------------------------: | :----------------------------------------------: |
|          Experimenting with iteration           |     Iterating using trigonometric functions      |

| ![Defining Materials with Python](/static/images/readme/cycles_render@200.png) |
| :----------------------------------------------------------------------------: |
|                         Defining Materials with Python                         |

| ![Node Based Material Experiments](/static/images/readme/node_mat_experiments.png) |
| :--------------------------------------------------------------------------------: |
|                          Node Based Material Experiments                           |

| ![Using graph editor and camera perspective to proof and tweak an animation](/static/images/readme/graph_editor.png) |
| :------------------------------------------------------------------------------------------------------------------: |
|                      Using graph editor and camera perspective to proof and tweak an animation                       |

| ![Mesh from scratch, composing and repetition](/static/images/readme/cycles_render_hq.png) |
| :----------------------------------------------------------------------------------------: |
|                        Mesh from scratch, composing and repetition                         |

| ![Procedural Animation Example](/static/images/readme/interface.png) |
| :------------------------------------------------------------------: |
|                     Procedural Animation Example                     |

| ![Status Bar Config - Show Scene Details, Memory, VRAM, Animation data, etc.](/static/images/readme/status_bar_config.png) |
| :------------------------------------------------------------------------------------------------------------------------: |
|                         Status Bar Config - Show Scene Details, Memory, VRAM, Animation data, etc.                         |

| ![Debugger Example](/static/images/readme/debugger.png) |
| :-----------------------------------------------------: |
|                    Debugger Example                     |
