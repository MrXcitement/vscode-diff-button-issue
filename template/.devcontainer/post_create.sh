#!/bin/env bash
# post_create.sh --- commands to run after the docker container has been created, not saved in image

set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes

## Get host architecture
ARCH="$(dpkg --print-architecture)"

##
# Install any dotfiles into the vscode user's home directory
echo
echo "******************************************************************************"
echo "Install dotfiles [$ARCH]..."
echo
rsync --backup -rv .devcontainer/home/ ~/

# glab cli glab requires configurtation files  to have permisions 600.
# git will store them with 644, so they need to be changed here.
chmod 600 /home/vscode/.config/glab-cli/*.yml

##
# Install any command line tools that can not be added as a feature
# echo
# echo "******************************************************************************"
# echo "Install cli tools [$ARCH]..."
# echo

##
# Install any language tools needed to solve the exercism track's exercises
# echo
# echo "******************************************************************************"
# echo "Install language tools [$ARCH]..."
# echo

