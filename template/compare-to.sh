#!/bin/bash

set -eou pipefail

COMPARE_FOLDER="${1:-../template}"

declare -a files
files=("README.md"
       "HELP.md"
       ".gitignore"
       ".editorconfig"
       ".vscode/settings.json"
       ".devcontainer/post_create.sh"
       ".devcontainer/devcontainer.json"
       ".devcontainer/home/.zshrc"
       ".devcontainer/home/.zshenv"
       ".devcontainer/home/.gitconfig")

for file in "${files[@]}"
do
    # code --wait -d "${COMPARE_FOLDER}/${file}" "./${file}"
    code -d "${COMPARE_FOLDER}/${file}" "./${file}"
done
