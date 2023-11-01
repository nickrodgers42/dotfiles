#1 /bin/zsh

install_brew() {
    echo "Installing brew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install_brew_deps() {
    echo "Installing dependencies from brew..."
    brew install \
        bat \
        eza \
        fd \
        fzf \
        gcc \
        make \
        neovim \
        ripgrep \
        stow \
        tmux
}

install_nvm() {
    echo "Installing nvm..."
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}

install_node() {
    echo "Installing node..."
    nvm install node
}

install_node_deps() {
    echo "Installing dependencies from npm..."
	npm i -g \
		eslint \
		tldr
}

install_tpm() {
    echo "Installing tpm..."
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

stow_dotfiles() {
    make stowall
}

install() {
    local OS=$(uname -s)
    
    install_brew
    if [[ $OS = "Linux" ]]
    then
        (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/runner/.bashrc
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
        export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
    fi

    install_brew_deps
    install_nvm
    install_node
    install_node_deps
    install_tpm
    stow_dotfiles
}

install
