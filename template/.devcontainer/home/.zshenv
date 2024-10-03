#!/bin/zsh
# .zshenv --- Usually run for every zsh

# Export environemnt key-value pairs from any file that ends in .env found in the ~/.env directory
if [[ -d $HOME/.env ]]; then
    for f ($HOME/.env/*.env); do
        export $(cat $f | sed -e /^$/d -e /^#/d | xargs)
    done
fi

## Configure the current path
# Feel free to add any path here since if a path does not exist on the current
# system it will not be added to the new path.

# Add paths before and after the existing path
newpath=(
$path
)

# Replace the current path using the newpath array,
# only existing paths will be added to the new path.
path=($^newpath(N))
unset newpath

# Remove duplicate entries from the current path
typeset -U path
