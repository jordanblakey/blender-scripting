#!/bin/bash

################################################################################
# Install Docker Engine on Ubuntu
################################################################################

echo "hint: --upgrade if needed."

if [ -n "$(docker version | grep 'Docker Engine')" ] && [ "$1" != "--upgrade" ]; then
  echo "Docker Engine is already installed."
else
  if [ "$1" == "--upgrade" ]; then
    echo "Reinstalling Docker Engine..."
  else
    echo "Docker Engine is not installed. Installing now..."
  fi

  # Remove any old versions of Docker:
  sudo apt-get remove docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc

  # Add Docker's official GPG key:
  sudo apt-get update
  sudo apt-get install ca-certificates curl
  sudo install -m 0755 -d /etc/apt/keyrings
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  sudo chmod a+r /etc/apt/keyrings/docker.asc

  # Add the repository to Apt sources:
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update

  # Install the Docker packages.
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

  # Verify the installation:
  sudo docker run hello-world

  if [ $? -ne 0 ]; then
    echo "Failed to install Docker Engine."
    exit 1
  else
    echo "Docker Engine installed successfully."
  fi
fi
docker --version

################################################################################
# Install act - GitHub Actions runner for local testing
################################################################################

# Install act using the official installation script
if command -v act &> /dev/null && [ "$1" != "--upgrade" ]; then
  echo "act is already installed."
else
  if [ "$1" == "--upgrade" ]; then
      echo "Reinstalling act..."
  else
    echo "act is not installed. Installing now..."
  fi

  # Download and install act
  sudo rm -f /usr/local/bin/act
  curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
  # Copy act executable to /usr/local/bin
  sudo cp bin/act /usr/local/bin/act
  sudo rm -rf bin
  # Verify the installation
  if [ $? -ne 0 ]; then
    echo "Failed to install act."
    exit 1
  else
    echo "act installed successfully."
  fi
fi
act --version

################################################################################
# Add more system dependencies here...
################################################################################
