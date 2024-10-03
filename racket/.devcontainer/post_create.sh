#!/bin/env bash
# post_create.sh --- commands to run after the docker container has been created, not saved in image

set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes

# backup_file(file)
#    file: The file/directory to be backed up
backup_file() {
     # backup a file/folder by renaming it with the current date and time
     local file="${1}"
     local file_ext

     # file/folder exists and is not a symlink
     if [[ -e "${file}" && ! -h "${file}" ]]; then
        file_ext=$(date +%Y%m%d%H%M)
        printf "Backup: %s -> %s\n" "${file}" "${file}.${file_ext}"
        mv "${file}" "${file}.${file_ext}"
     fi
}

echo "******************************************************************************"
echo "Update package manager and upgrade packages..."
echo "******************************************************************************"
sudo apt-get update
sudo apt-get upgrade -y

##
# Install language tools needed to solve the exercism track's exercises
echo "******************************************************************************"
echo Installing Racket...
echo "******************************************************************************"
# Install racket requirments
sudo apt-get install -y \
     libgtk2.0-dev \
     libjpeg-dev \
     xvfb

# Used the racker/racket docker hub github repo as inspiration
# https://github.com/racket/docker/tree/master
pushd /tmp
wget https://download.racket-lang.org/releases/8.10/installers/racket-8.10-x86_64-linux-cs.sh
sudo sh ./racket-8.10-x86_64-linux-cs.sh --create-dir --unix-style --dest /usr/
rm ./racket-8.10-x86_64-linux-cs.sh
popd

export SSL_CERT_FILE="/etc/ssl/certs/ca-certificates.crt"
export SSL_CERT_DIR="/etc/ssl/certs"

sudo raco setup
sudo raco pkg config --set catalogs \
    "https://download.racket-lang.org/releases/8.10/catalog/" \
    "https://pkg-build.racket-lang.org/server/built/catalog/" \
    "https://pkgs.racket-lang.org" \
    "https://planet-compats.racket-lang.org"
# raco pkg install --auto compiler-lib
raco pkg install --auto racket-langserver

echo "******************************************************************************"
echo "Install shell tools..."
echo "******************************************************************************"
sudo apt-get install -y \
     fzf \
     xdg-utils \
     zoxide
fzf --version
xdg-open --version
zoxide --version

echo "******************************************************************************"
echo "Copy dotfiles..."
echo "******************************************************************************"
for item in .devcontainer/dotfiles/.*; do
     file=$(basename "${item}")
     backup_file "${HOME}/${file}"
done
rsync -rv .devcontainer/dotfiles/.* ~/
