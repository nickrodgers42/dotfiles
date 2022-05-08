scriptencoding utf-8
set encoding=utf-8
syntax on

set exrc
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
set signcolumn=yes
set scrolloff=8

set wildmenu
set showcmd

set hlsearch
set smartcase
set ignorecase
set incsearch
set nohlsearch

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
set updatetime=50
map Y y$
imap jj <Esc>
let mapleader=" "

set guicursor=
set termguicolors
set listchars=space:⋅,tab:-->
set list

call plug#begin('~/.vim/plugged')
" General Plugins
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'gruvbox-community/gruvbox'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'preservim/nerdcommenter'
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-fugitive'
Plug 'vim-python/python-syntax'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'preservim/vim-pencil'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" nvim-tree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" nvim-lsp-installer
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" nvim-cmp
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'

call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({no_ignore=true})<cr>
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fv <cmd>lua require('telescope.builtin').find_files({search_dirs={"~/dotfiles"}, hidden=true})<cr>

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

let g:tmux_navigator_no_mappings = 1
let g:python_highlight_all = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

filetype plugin on
let g:nerdspacedelims = 1
let g:nerddefaultalign = 'left'

set completeopt=menu,menuone,noselect

highlight ExtraWhitespace ctermbg=red guibg=red
augroup HIGHLIGHT_WHITESPACE
    autocmd!
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
augroup END

augroup HTML_TAB
    autocmd!
    autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
augroup END

" ============= Word Processing ===============
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
" let g:limelight_default_coefficient = 0.7
let g:limelight_paragraph_span = -1
" let g:limelight_bop = '\n'
" let g:limelight_eop = '\ze\n^\s*'
let g:limelight_priority = -1
let g:goyo_width=81

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  setlocal noshowmode
  setlocal noshowcmd
  Limelight
  " ...
  map j gj
  map k gk

  setlocal formatoptions=a
  setlocal textwidth=80
  setlocal noexpandtab
  setlocal wrap
  setlocal linebreak

  setlocal spell spelllang=en_us
  set complete+=s
  highlight Normal guibg=#282828
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  " ...
endfunction

augroup GOYO
    autocmd!
    autocmd User GoyoEnter nested call <SID>goyo_enter()
    autocmd User GoyoLeave call <SID>goyo_leave()
    autocmd User GoyoLeave source ~/.vimrc
augroup END

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,text call pencil#init({'wrap': 'hard'})
augroup END

nnoremap <leader>w :Goyo<cr>
lua << EOF
require('Comment').setup()
require('nvim-web-devicons').setup { default = true; }
require('nvim-tree').setup {}
require('telescope').setup()
require('telescope').load_extension('fzf')
require('lualine').setup {
  options = {
    theme = 'gruvbox'
  }
}

local cmp = require "cmp"
local cmp_nvim_lsp = require "cmp_nvim_lsp"
local lspconfig = require "lspconfig"

-- Include the servers you want to have installed by default below
local servers = {
  "bashls",
  "jedi_language_server",
  "pylsp",
  "tsserver",
  "vimls",
  "yamlls",
  "zk"
}

require('nvim-lsp-installer').setup({
    ensure_installed = servers,
    automatic_installation = true
})

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c' }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {'i', 'c' }),
    ["<C-y>"] = cmp.config.disable,
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 'c'}),
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i', 'c'}),
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<CR>"] = cmp.mapping.confirm(),
    ["<Tab>"] = cmp.mapping.confirm({select = true})
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" }
  }, {
    { name = "buffer" },
  }),
})

cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "cmp_git" },
  }, {
    { name = "buffer" }
  })
})

cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer" }
  }
})

cmp.setup.cmdline(":", {
  sources = cmp.config.sources({
    { name = "path" }
  }, {
    { name = "cmdline" }
  })
})


-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gk', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local capabilities = cmp_nvim_lsp.update_capabilities(
    vim.lsp.protocol.make_client_capabilities())

for _, name in ipairs(servers) do
  lspconfig[name].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end
EOF
