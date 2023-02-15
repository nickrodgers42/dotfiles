NVIM_HOME := $(shell echo $${XDG_DATA_HOME:-$$HOME/.local/share})

stow:
	brew install stow


ripgrep:
	brew install ripgrep


fd:
	brew install fd


INIT_DIR := $(HOME)/.config/nvim


vim: stow ripgrep fd
	brew install neovim make
	stow -t ~ --ignore=ftplugin vim
	mkdir -p $(INIT_DIR)
	stow -t $(INIT_DIR) vim


tmux-install:
	brew install tmux


tpm: tmux-install
	-git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


tmux-conf: stow tpm
	stow -t ~ tmux
	tmux start-server
	tmux new-session -d
	~/.tmux/plugins/tpm/bin/install_plugins
	tmux kill-server


gitconfig: stow
	stow --adopt -t ~ git


intellij: stow
	stow -t ~ intellij


all: gitconfig tmux-conf vim intellij
