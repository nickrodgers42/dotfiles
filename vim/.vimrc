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
map Y y$
imap jj <Esc>
let mapleader=" "

set guicursor=
set listchars=space:⋅,tab:-->
set list

call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'preservim/nerdcommenter'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

call plug#end()

colorscheme gruvbox
set background=dark

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

filetype plugin on
let g:nerdspacedelims = 1
let g:nerddefaultalign = 'left'

set completeopt=menu,menuone,noselect

lua << EOF
local cmp = require "cmp"
local cmp_nvim_lsp = require "cmp_nvim_lsp"
local lsp_config = require "lspconfig"
local lsp_installer = require "nvim-lsp-installer"

-- Include the servers you want to have installed by default below
local servers = {
  "bashls",
  "pyright",
  "remarkls",
  "tsserver",
  "vimls",
  "yamlls",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end


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
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<CR>"] = cmp.mapping.confirm({ select = true })
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

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp_installer.on_server_ready(function(server)
  local opts = {
    capabilities = capabilities
  }
  server:setup(opts)
end)

EOF

lua << EOF
local devicons = require "nvim-web-devicons"

devicons.setup { default = true; }
EOF
