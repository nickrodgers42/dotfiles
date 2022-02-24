scriptencoding utf-8
set encoding=utf-8
syntax on

set noerrorbells

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set nostartofline

set number relativenumber
set nowrap
set colorcolumn=80
set scrolloff=8
set signcolumn=yes

set wildmenu
set showcmd

set hlsearch
set smartcase
set ignorecase
set incsearch

set backspace=indent,eol,start
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=

set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile

set ttimeoutlen=100
map Y y$
imap jj <Esc>
let mapleader=" "

set listchars=space:⋅,tab:-->
set list

call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'preservim/nerdcommenter'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'

call plug#end()

colorscheme gruvbox
set background=dark
nnoremap <c-p> :Files<cr>

filetype plugin on
let g:nerdspacedelims = 1
let g:nerddefaultalign = 'left'

