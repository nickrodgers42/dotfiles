# Dotfiles

A collection of dotfiles managed using GNU stow for symlinks


## Installation

### On Mac

* Run `make mac`

### On Ubuntu

* Run `make ubuntu`

### Other Platforms

1. Clone this repo
1. Install GNU stow
1. Call `stow <dir>` to install specific dotfiles

## Dependencies


### Required

* GNU Stow


-------------------------------------------------------------------------------

## Tool-specific Dependencies


### vim

This .vimrc uses Neovim-specific syntax and features. To use the .vimrc in
Neovim (from `:help nvim-from-vim`):

In `~/.config/nvim/init.vim`:

```vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```

* [vim-plug](https://github.com/junegunn/vim-plug) - run `:PlugInstall to
install plugins`
* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [fd](https://github.com/sharkdp/fd)


### tmux

* [tpm](https://github.com/tmux-plugins/tpm) - run `<leader> + I` to install
plugins


### fonts

* Comic Mono Font from https://github.com/dtinth/comic-mono-font
* Patched using [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)
