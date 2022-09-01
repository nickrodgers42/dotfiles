NVIM_HOME := $(shell echo $${XDG_DATA_HOME:-$$HOME/.local/share})

stow:
	sudo apt-get install -y stow


vim-plug:
	sh -c 'curl -fLo $(NVIM_HOME)/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


ripgrep:
	curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
	sudo dpkg -i ripgrep_13.0.0_amd64.deb


fd:
	sudo apt-get install -y fd-find


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
	sudo apt-get install -y build-essential git
	curl -L -o nvim-linux64.deb https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb
	sudo apt install ./nvim-linux64.deb
	stow -t ~ --ignore=ftplugin vim
	nvim +PlugInstall +qall


tmux-install:
	sudo apt-get install -y tmux


tpm: tmux-install
	-git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


tmux-conf: stow tpm
	stow -t ~ tmux
	tmux start-server
	tmux new-session -d
	~/.tmux/plugins/tpm/bin/install_plugins
	tmux kill-server


gitconfig: stow
	stow -t ~ git


intellij: stow
	stow -t ~ intellij


ftplugin: vim
	mkdir -p $(INIT_DIR)/ftplugin
	stow -d vim -t $(INIT_DIR)/ftplugin ftplugin


all: gitconfig tmux-conf vim intellij ftplugin
