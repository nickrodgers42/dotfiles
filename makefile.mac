NVIM_HOME := $(shell echo $${XDG_DATA_HOME:-$$HOME/.local/share})

vim-plug:
	sh -c 'curl -fLo $(NVIM_HOME)/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

ripgrep:
	brew install ripgrep

fd:
	brew install fd


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
	brew install neovim
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
