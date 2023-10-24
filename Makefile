brewinstall:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


brewdeps:
	brew install \
		bat \
		exa \
		fd \
		fzf \
		make \
		neovim \
		ripgrep \
		stow \
		tmux


brewenv:
	(echo; echo 'eval "$$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/runner/.bashrc
	eval "$$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


tpm:
	-git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


mac:
	make -f ./makefiles/mac.mk all


ubuntu:
	make -f ./makefiles/ubuntu.mk all
