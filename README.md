# blender-scripting

Experiments in automating Blender with Python.

## Setup Project for VSCode

```bash
# clone the repo with no history for fast download
git clone --depth 1 <repo-url>

# install dependencies
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
poe install # installs blender, act, ffmpeg
poe # list of useful project commands

# big idea: run Python scripts in Blender from the CLI
blender -P headless_mode.py  # run with UI to work visually - poe blend
blender -P headless_mode.py -b  # run without UI to debug (fast) - poe bblend
```

## `butils` module

`butils` abstracts common Blender scripting code and provides CLI commands.

```sh
python -m butils --help

# install requirements and butils symlink in Blender scripts directory
# run this every requirements.txt is updated.
python -m butils install # `poe install-butils`

# start new blender script
python -m butils create # `poe create`

# compress output images and videos
python -m butils compress -i render.png # `poe compress`
python -m butils compress -i render.mkv # `poe compress`

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

## Unit tests

This project uses Python's built-in `unittest` module for testing. Tests are executed within a Docker container that includes Blender, ensuring a consistent testing environment. This setup is defined in the GitHub Actions workflow file (`.github/workflows/blender_tests.yml`).

### Running Tests

There are several ways to run the tests:

- **Locally with `act`**:
  You can simulate the GitHub Actions environment locally using `act`. The `pyproject.toml` defines a `poe` task for this:

  ```sh
  poe act
  poe act --input="testcase=tests.test_module.TestCase.test_function"
  ```

  Refer to the `tool.poe.tasks.act` section in `pyproject.toml` and the `workflow_dispatch` inputs in `.github/workflows/blender_tests.yml` for more details on available parameters.

- **GitHub Actions**:
  Tests are automatically executed in GitHub Actions on every `push` and `pull_request` to the `main` branch.
  You can also manually trigger the "Blender Tests" workflow from the Actions tab in your GitHub repository, providing inputs for specific test cases, verbosity, etc.
  ```sh
  gh workflow run "Blender Tests" --input testcase=your_test_case --input verbosity=2
  ```

## Visual Notes, Renders

| ![reference modeling](/static/images/readme/topology_practice.png) |
| :----------------------------------------------------------------: |
|             Learning to create clean, precise topology             |

| ![reference modeling](/static/images/readme/modeling_with_reference_images.png) |
| :-----------------------------------------------------------------------------: |
|                     Learning to model with reference images                     |

| ![Rock texture](/static/images/readme/procedural-rock-shader.png) |
| :---------------------------------------------------------------: |
|          Creating rock textures from procedural shaders           |

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
