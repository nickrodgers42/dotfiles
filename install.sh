#1 /bin/zsh

install_brew() {
    echo "Installing brew..."
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install_brew_deps() {
    echo "Installing dependencies from brew..."
    brew install \
        bat \
        exa \
        fd \
        fzf \
        gcc \
        make \
        neovim \
        ripgrep \
        stow \
        tmux
}

install() {
    local OS=$(uname -s)
    
    install_brew
    if [[ $OS eq "Linux" ]]
    then
        (echo; echo 'eval "$$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/runner/.bashrc
        eval "$$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    fi

    install_brew_deps
}

install
