NVIM_HOME := $(shell echo $${XDG_DATA_HOME:-$$HOME/.local/share})

stow:
	brew install stow


vim-plug:
	sh -c 'curl -fLo $(NVIM_HOME)/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


ripgrep:
	brew install ripgrep


fd:
	brew install fd


INIT_DIR := $(HOME)/.config/nvim
INIT_FILE := $(INIT_DIR)/init.vim

define init_script
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
endef

export init_script
$(INIT_FILE):
	mkdir -p $(INIT_DIR)
	touch $(INIT_FILE)
	echo "$$init_script" > $(INIT_FILE)


vim: stow vim-plug ripgrep fd $(INIT_FILE)
	brew install neovim make
	stow -t ~ --ignore=ftplugin vim
	nvim +PlugInstall +qall


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


ftplugin: vim
	mkdir -p $(INIT_DIR)/ftplugin
	stow -d vim -t $(INIT_DIR)/ftplugin ftplugin


all: gitconfig tmux-conf vim intellij ftplugin
