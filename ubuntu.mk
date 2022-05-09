NVIM_HOME := $(shell echo $${XDG_DATA_HOME:-$$HOME/.local/share})

vim-plug:
	sh -c 'curl -fLo $(NVIM_HOME)/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

ripgrep:
	curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
	sudo dpkg -i ripgrep_13.0.0_amd64.deb

fd:
	sudo apt-get install fd-find


INIT_FILE := $(HOME)/.config/nvim/init.nvim

define init_script
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
endef

export init_script
$(INIT_FILE):
	echo "$$init_script" > $(INIT_FILE)


vim: vim-plug ripgrep fd $(INIT_FILE)
	brew install neovim build-essential
	stow vim
	# echo "alias vim=nvim" >> $(HOME)/.zshrc
	nvim +PlugInstall +qall


tpm:
	-git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


tmux: tpm
	stow tmux
	~/.tmux/plugins/tpm/bin/install_plugins


gitconfig:
	stow git


all: gitconfig tmux vim
