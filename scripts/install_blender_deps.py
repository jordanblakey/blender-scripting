#!/usr/bin/env python3
"""Installs deps and symlinks between project and Blender's py environment."""

import importlib
import re
import subprocess
import sys
import tomllib
from pathlib import Path
from types import ModuleType

import bpy


def main():
    # parse the pyproject.toml file to get dependencies
    pyproject = parse_project_toml()
    deps = pyproject["tool"]["poetry"]["dependencies"]

    # clean modules directory
    modules_dir = f"{bpy.utils.script_path_user()}/modules"
    Path(modules_dir).mkdir(parents=True, exist_ok=True)

    # install python dependencies in blender's environment
    for module_name in deps:
        install_blender_dep(module_name, modules_dir)
    colorama = importlib.import_module("colorama")
    colorama.init(autoreset=True)
    print(colorama.Fore.GREEN + "Blender deps successfully installed.")

    # create symlinks
    create_cycles_symlink()
    create_butils_symlink(modules_dir)
    print(colorama.Fore.GREEN + "Symlink creation succeeded.")


def get_project_root(marker="pyproject.toml"):
    """Get project root by searching for a marker file there."""
    current = Path(__file__).resolve()
    for parent in [current] + list(current.parents):
        if (parent.joinpath(marker)).exists():
            return str(parent)
    raise FileNotFoundError(f"Project root marker '{marker}' not found.")


def parse_project_toml(toml_file="pyproject.toml"):
    """Parse the pyproject.toml file and return its contents as a dict."""
    root = get_project_root()
    path = Path(root).joinpath(toml_file)
    with open(path, "rb") as f:
        return tomllib.load(f)


def install_blender_dep(mod, mod_dir):
    """Install a python dependency in blender's environment using pip."""
    command = [sys.executable, "-m", "pip", "install"]
    flags = [f"--target={mod_dir}", "--upgrade", mod]
    subprocess.check_call([*command, *flags])


def create_cycles_symlink():
    """Create symlink to cycles addon in butils/btyping for type checking."""
    path = Path(sys.executable)
    # find version directory
    while len(path.parts) > 1 and not re.match(r"^[\d\.]+$", path.name):
        path = path.parent
    # find the source and destination paths
    cycles_dir = path.joinpath("scripts", "addons_core", "cycles")
    btyping_dir = Path(get_project_root()).joinpath("butils", "btyping")
    cycles_symlink = btyping_dir.joinpath("cycles")
    # create the symlink
    if cycles_symlink.exists():
        cycles_symlink.unlink()
    cycles_symlink.symlink_to(cycles_dir, target_is_directory=True)
    if not cycles_dir.is_dir() and cycles_symlink.is_symlink():
        raise RuntimeError(f"Symlink failure: {cycles_symlink} -> {cycles_dir}")
    # test butils.btyping.cycles import
    cycles = importlib.import_module("butils.btyping.cycles")
    if not isinstance(cycles, ModuleType):
        raise RuntimeError("Failed to import butils.btyping.cycles module.")
    print(f"Symlink successful: {cycles_symlink} -> {cycles_dir}")


def create_butils_symlink(modules_dir):
    """Create symlink to butils in blender's modules dir for scripts."""
    # find the source and destination paths
    butils_dir = Path(get_project_root()).joinpath("butils")
    butils_symlink = Path(modules_dir).joinpath("butils")
    # create the symlink
    if butils_symlink.exists():
        butils_symlink.unlink()
    butils_symlink.symlink_to(butils_dir, target_is_directory=True)
    if not butils_dir.is_dir and butils_symlink.is_symlink():
        raise RuntimeError(f"Simlink failure: {butils_symlink} -> {butils_dir}")
    # test butils import
    butils = importlib.import_module("butils")
    if not isinstance(butils, ModuleType):
        raise ImportError("Failed to import butils module.")
    print(f"Symlink successful: {butils_symlink} -> {butils_dir}")


if __name__ == "__main__":
    if not hasattr(bpy, "app"):
        raise RuntimeError("Script should run in Blender's Python env.")
    main()
