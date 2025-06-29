# blender-scripting

Experiments in automating Blender with Python.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

## Table of Contents

- [Setup Project for VSCode](#setup-project-for-vscode)
- [`butils` module](#butils-module)
- [Unit tests](#unit-tests)
- [Visual Notes and Renders](#visual-notes-and-renders)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Setup Project for VSCode

### Installation

```sh
brew install poetry
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

```sh
# General help
python -m butils --help

# Install dependencies into Blender's Python environment and symlink `butils`
# Run this when new dependencies are added to `butils`.
python -m butils install
# (Alias: poe install-butils)

# Create a new Blender starter script
python -m butils create -i my_new_script.py
# (Alias: poe create)
# The -i/--input-file flag specifies the name for the new script.

# Compress output images and videos
# Supported image formats: .png, .jpg, .jpeg
# Supported video formats: .mkv, .mp4
python -m butils compress -i path/to/your/file.png
python -m butils compress -i path/to/your/file.mkv --crf 23
# (Alias: poe compress)

# Options for 'compress':
# -i, --input-file: (Required) Path to the image or video file to compress.
# --analyze: (For images only) Get image attrs and metadata. Skips compression.
# --crf: Constant Rate Factor. Sets bitrate (e.g., 18-28). Lower is better.

# profile GPU performance
pipx run nvitop

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
│   │   └── requirements.py  # Command to install deps in Blender's Python
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

### Pre-commit Hooks & Code Quality

This project uses the `pre-commit` python module to ensure code quality and
consistency. These hooks are automatically installed when you run `poe install`,
and can be run on demand with `poe pre-commit`.

- lint and format using `ruff`, `shfmt`, `shellcheck`, and `markdownlint`,
  `yamllint`, `actionlint`.
- check spelling, trim trailing spaces, add final newline to files.
- validate links, scan for large files, warn about any added secrets.
- validate json, yaml and toml files.

## Unit tests

This project uses Python's built-in `unittest` module for testing. Tests are
executed within a Docker container that includes Blender, ensuring a consistent
testing environment. This setup is defined in the GitHub Actions workflow file
(`.github/workflows/blender_tests.yml`).

### Running Tests

There are several ways to run the tests:

- **Locally with `act`**: You can simulate the GitHub Actions environment
  locally using `act`. The `pyproject.toml` defines a `poe` task for this:

  ```sh
  poe act
  poe act --input="testcase=tests.test_module.TestCase.test_function"
  ```

  Refer to the `tool.poe.tasks.act` section in `pyproject.toml` and the
  `workflow_dispatch` inputs in `.github/workflows/blender_tests.yml` for more
  details on available parameters.

- **GitHub Actions**: Tests are automatically executed in GitHub Actions on
  every `push` and `pull_request` to the `main` branch. You can also manually
  trigger the "Blender Tests" workflow from the Actions tab in your GitHub
  repository, providing inputs for specific test cases, verbosity, etc.

  ```sh
  gh workflow run "Blender Tests" --input testcase=your_test_case --input verbosity=2
  ```

## Visual Notes and Renders

grease_pencil_test

| ![grease_pencil_test][grease_pencil_test] |
| :---------------------------------------: |
|    Drawn animation with grease pencil.    |

|          ![photogrammetry_experiment][photogrammetry_experiment]          |
| :-----------------------------------------------------------------------: |
| Photogrammetry experiment in [Meshroom](github.com/alicevision/Meshroom). |

| ![hdri_transform_test_2][hdri_transform_test_2] |
| :---------------------------------------------: |
|       Hyperspace effect w/ HDRI scaling.        |

|  ![geo_nodes_cube_grid][geo_nodes_cube_grid]   |
| :--------------------------------------------: |
| Animating instance scale with a noise texture. |

| ![simple_lighting_experiments][simple_lighting_experiments] |
| :---------------------------------------------------------: |
|             Exploring basic lighting concepts.              |

|           ![geo_node_drivers][geo_node_drivers]           |
| :-------------------------------------------------------: |
| Using a driver to control a value with a named attribute. |

|          ![geo_node_random_value][geo_node_random_value]          |
| :---------------------------------------------------------------: |
| Getting collection instances by random index with geometry nodes. |

|   ![read_variables][read_variables]    |
| :------------------------------------: |
| Reading variables with geometry nodes. |

| ![lego_geometry_nodes][lego_geometry_nodes] |
| :-----------------------------------------: |
|  meshes from scratch using geometry nodes.  |

| ![soborg_chair_anim][soborg_chair_anim] |
| :-------------------------------------: |
|     Finished chair modeling series.     |

|        ![profiling_gpu_performance][profiling_gpu_performance]        |
| :-------------------------------------------------------------------: |
| Profiling GPU performance to identify bottlenecks in render pipeline. |

| ![chair_uv_unwrap][chair_uv_unwrap] |
| :---------------------------------: |
| UV unwrap to prepare for texturing. |

| ![chair_model_complete][chair_model_complete] |
| :-------------------------------------------: |
|             Chair model complete.             |

|      ![sphere_boolean_anim][sphere_boolean_anim]      |
| :---------------------------------------------------: |
| `brew install gifski && gifski -o file.gif img0*.png` |

| ![ui_manipulation][ui_manipulation] |
| :---------------------------------: |
|   Manipulating the UI with Python   |

| ![blender_beginner_tutorial][blender_beginner_tutorial] |
| :-----------------------------------------------------: |
|                        Tradition                        |

|       ![rendering_compositing][rendering_compositing]       |
| :---------------------------------------------------------: |
| Practicing rendering and combining images in the compositor |

|         ![basic_interior][basic_interior]         |
| :-----------------------------------------------: |
| Composing an interior scene with 3rd party models |

| ![glitter_waves_viewport][glitter_waves_viewport] |
| :-----------------------------------------------: |
|             Animating geometry nodes              |

| ![modifier exploration][modifier_exploration] |
| :-------------------------------------------: |
|              Exploring modifiers              |

|  ![reference modeling][topology_practice]  |
| :----------------------------------------: |
| Learning to create clean, precise topology |

| ![reference modeling][modeling_with_reference_images] |
| :---------------------------------------------------: |
|        Learning to model with reference images        |

|    ![Rock texture][procedural_rock_shader]     |
| :--------------------------------------------: |
| Creating rock textures from procedural shaders |

| ![Writing Shaders in OSL][writing_shaders_in_osl] |
| :-----------------------------------------------: |
|   Writing Shaders in Open Shader Language (OSL)   |

| ![Parametric Modeling with Geometry Nodes][parameteric_meshes_geometry_nodes] |
| :---------------------------------------------------------------------------: |
|                    Parametric Modeling with Geometry Nodes                    |

| ![Hard Surface Modeling][hard_surface_modeling] |
| :---------------------------------------------: |
|         Learning Hard Surface Modeling          |

| ![Geometry Nodes][geometry_nodes_and_materials] |
| :---------------------------------------------: |
|   Working with node based geometry modifiers    |

| ![Iterative Material Experiments][iterative_material_exploration_bsdf] |
| :--------------------------------------------------------------------: |
|                     Iterative Material Experiments                     |

| ![Exploring Fresnel and adding bloom with compositor][fresnel_node_bloom] |
| :-----------------------------------------------------------------------: |
|        Exploring Fresnel node and adding bloom with the compositor        |

| ![Wave -> Voronoi -> Displace][material_wave_texture_voronoi_displacement] |
| :------------------------------------------------------------------------: |
|              Wave Texture -> Voronoi Texture -> Displacement               |

|    ![Screen1][iteration]     |         ![Screen2][iteration2]          |
| :--------------------------: | :-------------------------------------: |
| Experimenting with iteration | Iterating using trigonometric functions |

| ![Defining Materials with Python][cycles_render_200] |
| :--------------------------------------------------: |
|            Defining Materials with Python            |

| ![Node Based Material Experiments][node_mat_experiments] |
| :------------------------------------------------------: |
|             Node Based Material Experiments              |

| ![Using graph editor and camera view to proof an animation][graph_editor] |
| :-----------------------------------------------------------------------: |
|         Using graph editor and camera view to proof an animation          |

| ![Mesh from scratch, composing and repetition][cycles_render_hq] |
| :--------------------------------------------------------------: |
|           Mesh from scratch, composing and repetition            |

| ![Procedural Animation Example][interface] |
| :----------------------------------------: |
|        Procedural Animation Example        |

[grease_pencil_test]: /static/images/readme/grease_pencil_anim_test1.gif
[photogrammetry_experiment]:
  /static/images/readme/captioned_photogrammetry_images.png
[hdri_transform_test_2]: /static/images/readme/hdri_transform_test_2.gif
[geo_nodes_cube_grid]: /static/images/readme/geo_nodes_cube_grid.gif
[simple_lighting_experiments]:
  /static/images/readme/simple_lighting_experiments.jpg
[geo_node_random_value]:
  /static/images/readme/geo_nodes_random_value_from_collection.gif
[geo_node_drivers]: /static/images/readme/geo_nodes_drivers.gif
[read_variables]: /static/images/readme/read_variables.gif
[lego_geometry_nodes]: /static/images/readme/lego_geometry_nodes.png
[soborg_chair_anim]: /static/images/readme/soborg_chair.gif
[profiling_gpu_performance]: /static/images/readme/profiling_gpu_performance.png
[chair_uv_unwrap]: /static/images/readme/chair_uv_unwrap.png
[chair_model_complete]: /static/images/readme/chair_model_complete.png
[sphere_boolean_anim]: /static/images/readme/sphere_animation.gif
[ui_manipulation]: /static/images/readme/ui_manipulation.png
[blender_beginner_tutorial]: /static/images/readme/blender_beginner_tutorial.png
[rendering_compositing]: /static/images/readme/rendering_practice_car.png
[basic_interior]: /static/images/readme/basic_interior.png
[glitter_waves_viewport]: /static/images/readme/glitter_waves_viewport.png
[modifier_exploration]: /static/images/readme/modifier_exploration.png
[topology_practice]: /static/images/readme/topology_practice.png
[modeling_with_reference_images]:
  /static/images/readme/modeling_with_reference_images.png
[procedural_rock_shader]: /static/images/readme/procedural-rock-shader.png
[writing_shaders_in_osl]: /static/images/readme/writing_shaders_in_osl.png
[parameteric_meshes_geometry_nodes]:
  /static/images/readme/parameteric_meshes_geometry_nodes.png
[hard_surface_modeling]: /static/images/readme/hard_surface_modeling.png
[geometry_nodes_and_materials]:
  /static/images/readme/geometry_nodes_and_materials.png
[iterative_material_exploration_bsdf]:
  /static/images/readme/iterative_material_exploration-BSDF.png
[fresnel_node_bloom]: /static/images/readme/fresnel_node+bloom.png
[material_wave_texture_voronoi_displacement]:
  /static/images/readme/materal_wave-texture_voronoi_displacement.png
[iteration]: /static/images/readme/iteration.png
[iteration2]: /static/images/readme/iteration2.png
[cycles_render_200]: /static/images/readme/cycles_render@200.png
[node_mat_experiments]: /static/images/readme/node_mat_experiments.png
[graph_editor]: /static/images/readme/graph_editor.png
[cycles_render_hq]: /static/images/readme/cycles_render_hq.png
[interface]: /static/images/readme/interface.png
