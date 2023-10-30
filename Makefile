NVIM_HOME := $(shell echo $${XDG_DATA_HOME:-$$HOME/.local/share})
INIT_DIR := $(HOME)/.config/nvim


vim:
	stow -t ~ --ignore=ftplugin vim
	mkdir -p $(INIT_DIR)
	stow -t $(INIT_DIR) vim


tmux-conf:
	stow -t ~ tmux


gitconfig:
	stow --adopt -t ~ git


intellij:
	stow -t ~ intellij


stowall: gitconfig tmux-conf vim intellij
