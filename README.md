# blender-scripting

Experiments in automating Blender with Python.

## Setup Project for VSCode

### Installation

```sh
# clone the repo with no history for fast download
git clone --depth 1 <repo-url>
# https://python-poetry.org/docs/#installing-with-the-official-installer
curl -sSL https://install.python-poetry.org | python3 -
# https://python-poetry.org/docs/#enable-tab-completion-for-bash-fish-or-zsh
poetry completions bash >> ~/.bash_completion
poetry completions fish > ~/.config/fish/completions/poetry.fish
# run this once to create venv and install poe
poetry install
# run to (re)install everything--this is the main install command
poe install
```

### The Big Idea: run Python scripts in Blender from the CLI

```sh
# run with UI to work visually
blender -P headless_mode.py # `poe blend`
# run without UI to debug (fast)
blender -P headless_mode.py -b # `poe bblend`
```

## `butils` module

`butils` abstracts common Blender scripting code and provides CLI commands.

| Command                                                       | Description                                                                 | Options                                                                                                                                                              |
| :------------------------------------------------------------ | :-------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `python -m butils --help`                                     | General help                                                                | `--help`                                                                                                                                                             |
| `python -m butils install`                                    | Install dependencies into Blender's Python environment and symlink `butils`. |                                                                                                                                                                      |
| `python -m butils create -i <filename>.py`                    | Create a new Blender starter script.                                        | `-i/--input-file <filename>.py`: Specifies the name for the new script.                                                                                              |
| `python -m butils compress -i <filepath>`                     | Compress output images and videos.                                          | `-i/--input-file <filepath>`: (Required) Path to the image or video file to compress.<br />`--analyze`: (Images only) Get image attributes and metadata. Skips compression.<br />`--crf <value>`: (Videos only) Constant Rate Factor (e.g., 18-28). Lower is better. |

Supported image formats for compression: `.png`, `.jpg`, `.jpeg`
Supported video formats for compression: `.mkv`, `.mp4`

Aliases:
- `poe install-butils` for `python -m butils install`
- `poe create` for `python -m butils create -i <filename>.py`
- `poe compress` for `python -m butils compress -i <filepath>`

# module structure
butils/
├── animation/
│   ├── fcurve.py  # Utilities for F-Curves
│   └── keyframe.py  # Utilities for keyframes
├── blend_file.py  # Work with .blend files
├── btyping/
│   ├── animation.py  # Type hints for animation module
│   └── render.py  # Type hints for render module
├── commands/  # CLI commands
│   ├── compress/
│   │   ├── image.py  # Image compression commands
│   │   └── video.py  # Video compression commands
│   ├── install/
│   │   ├── pythonpath.py  # Command to set up Python path for Blender
│   │   └── requirements.py  # Command to install dependencies in Blender's Python
│   └── starter/
│       ├── create.py  # Command to create a new starter script
│       └── starter_script.py  # Boilerplate for scripting a Blender scene
├── mesh.py  # Simplify working with meshes
├── render/
│   ├── config.py  # Rendering configuration utilities
│   ├── optimize.py  # Utilities for optimizing render performance
│   ├── render.py  # Core rendering utilities
│   └── update_mask.py  # Utilities for updating render masks
├── scene.py  # Clean scenes, work with collections
└── ui.py  # Work with the Blender UI: get contexts, control viewport
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

## Visual Notes and Renders

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
