#!/usr/bin/env sh
# installs all project dependencies.
# usage: ./scripts/install.sh

set -e

# python: venv, py deps
./scripts/snackbar.sh "checking python environment" "magenta"
poetry env use python3
poetry env info
poetry lock
poetry check

./scripts/snackbar.sh "installing python dependencies" "magenta"
poetry install

# act: installs docker engine, gh, and act
./scripts/snackbar.sh "installing act to run github workflows locally" "magenta"
./scripts/install_act.sh

# blender: via snap
./scripts/snackbar.sh "installing blender" "magenta"
sudo snap install blender

# apt packages: ffmpeg
./scripts/snackbar.sh "installing apt packages" "magenta"
sudo apt install ffmpeg

# git hooks: install and test
./scripts/snackbar.sh "installing and testing githooks" "magenta"
./scripts/install_githooks.sh