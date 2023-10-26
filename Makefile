NVIM_HOME := $(shell echo $${XDG_DATA_HOME:-$$HOME/.local/share})
INIT_DIR := $(HOME)/.config/nvim


brewinstall:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


brewdeps:
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


brewenv:
	(echo; echo 'eval "$$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/runner/.bashrc
	eval "$$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


nvm:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash


node:
	nvm install node


nodedeps:
	npm i -g \
		eslint \
		tldr


tpm:
	-git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


vim:
	stow -t ~ --ignore=ftplugin vim
	mkdir -p $(INIT_DIR)
	stow -t $(INIT_DIR) vim


tmux-conf:
	stow -t ~ tmux
	tmux start-server
	tmux new-session -d
	~/.tmux/plugins/tpm/bin/install_plugins
	tmux kill-server


gitconfig:
	stow -t ~ git


intellij:
	stow -t ~ intellij


stowall: gitconfig tmux-conf vim intellij
