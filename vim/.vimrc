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

Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'

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
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

filetype plugin on
let g:nerdspacedelims = 1
let g:nerddefaultalign = 'left'

set completeopt=menu,menuone,noselect

augroup NERDTREE
    autocmd!
    " Exit Vim if NERDTree is the only window remaining in the only tab.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    " Close th tab if NERDTree is the only window remaining in it.
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endife
augroup END

augroup HTML_TAB
    autocmd!
    autocmd FileType html setlocal tabstop=2
augroup END

lua << EOF
local cmp = require "cmp"
local cmp_nvim_lsp = require "cmp_nvim_lsp"
local lsp_config = require "lspconfig"
local lsp_installer = require "nvim-lsp-installer"

-- Include the servers you want to have installed by default below
local servers = {
  "bashls",
  "pyright",
  "tsserver",
  "vimls",
  "yamlls",
  "zk"
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
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
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

lsp_installer.on_server_ready(function(server)
  local opts = {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
  server:setup(opts)
end)

EOF

lua << EOF
local devicons = require "nvim-web-devicons"

devicons.setup { default = true; }
EOF
