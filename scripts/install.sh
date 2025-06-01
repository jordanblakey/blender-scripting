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

if ! command -v blender >/dev/null; then
	echo 'Blender is not installed.'
	sudo snap install blender
else
	echo 'Blender is already installed.'
	candidate="$(snap info blender | grep latest/stable: | awk '{ print $2 }')"
	installed="$(snap info blender | grep installed | awk '{ print $2 }')"
	echo "Installed version: $installed"
	echo "Candidate version: $candidate"
	if [ "$installed" = "$candidate" ]; then
		echo "Blender snap is up to date."
	else
		echo "Blender snap is not up to date."
		sudo snap refresh blender
	fi
fi

# apt packages: ffmpeg
./scripts/snackbar.sh "installing apt packages" "magenta"
apt_packages_to_install="ffmpeg"
# Check if apt packages are installed
for package in $apt_packages_to_install; do
	if ! dpkg -l | grep -q "^ii  $package "; then
		echo "Installing $package..."
		sudo apt install -y "$package"
	else
		echo "$package is already installed."
		installed="$(apt-cache policy ffmpeg | grep Installed | awk '{print $2}')"
		candidate="$(apt-cache policy ffmpeg | grep Candidate | awk '{print $2}')"
		echo "Installed version: $installed"
		echo "Candidate version: $candidate"
		if [ "$installed" = "$candidate" ]; then
			echo "$package is up to date."
		else
			echo "$package is not up to date."
			sudo apt install --only-upgrade -y "$package"
		fi
	fi
done

# git hooks: install and test
./scripts/snackbar.sh "installing and testing githooks" "magenta"
./scripts/install_githooks.sh
