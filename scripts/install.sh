#!/usr/bin/env sh
# installs all dependencies and validates the project.
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

if ! command -v blender &> /dev/null; then
  sudo snap install blender
else
  sudo snap refresh blender
fi

# apt packages: ffmpeg
./scripts/snackbar.sh "installing apt packages" "magenta"
sudo apt install ffmpeg

# git hooks: install and test
./scripts/snackbar.sh "installing and testing githooks" "magenta"
./scripts/install_githooks.sh