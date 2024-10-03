#!/bin/zsh
# .zshrc --- Configure zsh interactive shell for use in devcontainer

# Define the location for oh-my-zsh and custom plugins and themes
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$ZSH/custom

# Clone spaceship-prompt/spaceship-prompt
if [[ ! -d $ZSH_CUSTOM/themes/spaceship-prompt ]]; then
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git $ZSH_CUSTOM/themes/spaceship-prompt --depth=1
    ln -s $ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme $ZSH_CUSTOM/themes/spaceship.zsh-theme
fi

# Clone zsh-users/zsh-autosuggestions
if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi

# Clone zsh-users/zsh-completions and add to fpath
if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-completions" ]]; then
    git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions
fi
fpath=($ZSH_CUSTOM/plugins/zsh-completions/src $fpath)

# Clone zsh-users/zsh-syntax-highlighting
if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi

# Configure exercism completions if installed
exercism_completion_file=/usr/local/share/exercism/exercism_completion.zsh
if [[ -f $exercism_completion_file ]]; then
    if [[ ! -f $HOME/.zsh/functions/_exercism ]]; then
        mkdir -p $HOME/.zsh/functions
        cp $exercism_completion_file $HOME/.zsh/functions/_exercism
    fi
    fpath=($HOME/.zsh/functions $fpath)
fi

# Set name of the theme to load
ZSH_THEME="spaceship"

# Change the auto-update behavior
zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 7

# Configure plugins to load
plugins=(
    command-not-found
    dotenv
    fzf
    git
    zoxide
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Initialize oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Configure user environemnt and aliases
export EDITOR='code --wait'
