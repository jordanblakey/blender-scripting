# blender-scripting

Experiments in automating Blender with Python.

## Setup Project for VSCode

```bash
# clone repo with no history for fast download
git clone --depth 1 <repo-url>

# install system packages
sudo snap install blender && sudo apt install ffmpeg

# create a virtual environment
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

# run Python scripts in Blender from the CLI
blender -P headless_mode.py -b  # run without UI to debug scripts (fast)
blender -P headless_mode.py  # run with UI to check output and work visually
```

## `butils` module

`butils` abstracts common Blender scripting code and provides CLI commands.

```sh
python -m butils --help

# install requirements and butils symlink in Blender scripts directory
# run this every requirements.txt is updated.
python -m butils install

# start new blender script
python -m butils create

# compress output images and videos
python -m butils compress -i render.png
python -m butils compress -i render.mkv

# module structure
butils/
├── commands/  # CLI commands available when running butils as a module
├── starter_script.py  # boilerplate for scripting a blender scene
├── blend_file.py  # work with .blend files
├── animation/  # work with keyframe animations
├── scene.py  # clean scenes, work with collections
├── mesh.py  # simplify working with meshes
├── render/  # simplify rendering viewport, stills, and animations
└── ui.py  # work with the blender ui: get contexts, control viewport
```

## Visual Notes, Renders

| ![Writing Shaders in OSL](/static/images/readme/writing_shaders_in_osl.png) |
| :-------------------------------------------------------------------------: |
|                Writing Shaders in Open Shader Language (OSL)                |

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
