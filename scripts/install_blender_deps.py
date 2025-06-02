#!/usr/bin/env python3
"""install blender dependencies from pyproject.toml."""

import subprocess
import sys
import tomllib
from pathlib import Path

import bpy


def main():
    # parse the pyproject.toml file to get dependencies
    pyproject = parse_project_toml()
    deps = pyproject["tool"]["poetry"]["dependencies"]

    # clean modules directory
    modules_dir = f"{bpy.utils.script_path_user()}/modules"
    # shutil.rmtree(modules_dir)
    Path(modules_dir).mkdir(parents=True, exist_ok=True)

    # install dependencies
    for module_name in deps:
        install_blender_dep(module_name, modules_dir)


def get_project_root(marker="pyproject.toml"):
    """get project root by searching for a marker file there."""
    current = Path(__file__).resolve()
    for parent in [current] + list(current.parents):
        if (parent / marker).exists():
            return str(parent)
    raise FileNotFoundError(f"Project root with marker '{marker}' not found.")


def parse_project_toml(toml_file="pyproject.toml"):
    """Parse the pyproject.toml file and return its contents as a dict."""
    root = get_project_root()
    path = Path(root) / toml_file
    with open(path, "rb") as f:
        return tomllib.load(f)


def install_blender_dep(module_name, modules_dir):
    """Install a python dependency in blender's environment using pip."""
    subprocess.check_call(
        [
            sys.executable,
            "-m",
            "pip",
            "install",
            f"--target={modules_dir}",
            "--upgrade",
            module_name,
        ]
    )


if __name__ == "__main__":
    if not hasattr(bpy, "app"):
        raise RuntimeError("This script should be run in Blender's Python environment.")
    main()
