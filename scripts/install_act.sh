#!/usr/bin/env sh
# https://nektosact.com/
# installs the act command for running github actions locally.
# usage: gh act push

# check docker engine installed
if ! docker version | grep -q Engine; then
	# install docker engine
	# https://docs.docker.com/engine/install/ubuntu/#install-from-a-package
	for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

	# add docker's official gpg key:
	sudo apt-get update
	sudo apt-get install ca-certificates curl -y
	sudo install -m 0755 -d /etc/apt/keyrings
	sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
	sudo chmod a+r /etc/apt/keyrings/docker.asc

	# add the repository to apt sources:
	echo \
		"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" |
		sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
	sudo apt-get update
	sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
	sudo docker run hello-world
fi

# check gh command installed
if ! command -v gh >/dev/null; then
	# install github cli
	# https://github.com/cli/cli/blob/trunk/docs/install_linux.md
	(command -v wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) &&
		sudo mkdir -p -m 755 /etc/apt/keyrings &&
		out=$(mktemp) && wget -nv -O "$out" https://cli.github.com/packages/githubcli-archive-keyring.gpg &&
		tac "$out" | tac "$out" | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg >/dev/null &&
		sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg &&
		echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null &&
		sudo apt update &&
		sudo apt install gh -y
	sudo apt update
	sudo apt install gh
fi

# install act
# https://nektosact.com/installation/gh.html
gh extension install https://github.com/nektos/gh-act
gh act --version
