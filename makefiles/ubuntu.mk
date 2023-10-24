NVIM_HOME := $(shell echo $${XDG_DATA_HOME:-$$HOME/.local/share})
INIT_DIR := $(HOME)/.config/nvim

vim:
	stow -t ~ --ignore=ftplugin vim
	mkdir -p $(INIT_DIR)
	stow -t $(INIT_DIR) vim
	stow -t $(HOME) vim


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


all: gitconfig tmux-conf vim intellij
