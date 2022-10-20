vim.opt.errorbells = false

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.startofline = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8

vim.opt.wildmenu = true
vim.opt.showcmd = true

vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.incsearch = true

vim.opt.backspace = "indent,eol,start"
vim.opt.ruler = true
vim.opt.laststatus = 2
vim.opt.confirm = true
vim.opt.visualbell = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true

vim.opt.ttimeoutlen = 100
vim.opt.updatetime = 50

vim.g.mapleader = " "
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {})
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {})
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

vim.opt.guicursor = nil
vim.opt.termguicolors = true
vim.opt.listchars = { space = '⋅' , tab = '⋅⋅»' }
vim.opt.list = true
vim.opt.mouse = nil


local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- General Plugins
  use 'airblade/vim-gitgutter'
  use 'christoomey/vim-tmux-navigator'
  use 'gruvbox-community/gruvbox'
  use 'numToStr/Comment.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'preservim/nerdcommenter'
  use 'psliwka/vim-smoothie'
  use 'tpope/vim-fugitive'
  use 'vim-python/python-syntax'
  use 'vimwiki/vimwiki'
  use 'mhinz/vim-startify'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'mfussenegger/nvim-jdtls'
  use 'vim-test/vim-test'
  use 'preservim/vimux'

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- nvim-tree
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  -- lsp stuff
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- nvim-cmp
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'

  if packer_bootstrap then
    require('packer').sync()
  end
end)

vim.cmd([[
colorscheme gruvbox
highlight Normal guibg=none
filetype plugin on
]])

vim.g.python_highligh_all = 1
vim.g.tmux_navigator_no_mappings = 1
vim.g.vimwiki_listsyms = ' ○◐●✓'
vim.g["test#strategy"] = 'vimux'
vim.g.VimuxOrientation = "h"
vim.g.raccoon = {
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⢠⣾⣷⣦⣄⠀⠀⣀⣀⣀⣀⣀⣀⠀⠀⣠⣴⣾⣷⡄⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⣿⣿⣿⣿⠟⠉⠉⠀⠀⠀⠀⠀⠀⠉⠉⠻⣿⣿⣿⣿⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⣿⣿⡿⠋⠀⣀⣀⠀⠀⠀⠀⠀⠀⣀⣀⠀⠙⢿⣿⣿⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⣿⠏⣠⣾⣿⣿⣿⣿⣷⣦⣴⣾⣿⣿⣿⣿⣷⣄⠹⣿⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⢁⣼⣿⠿⠛⠉⠉⠛⢿⣿⣿⡿⠛⠉⠉⠛⠿⣿⣧⡈⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⣠⡿⠛⠁⠀⣀⣤⣤⣀⠈⢿⡿⠁⣀⣤⣤⣀⠀⠈⠛⢿⣄⠀⠀⠀⠀',
    '⠀⠀⢀⣼⠟⠀⠀⠀⠀⠻⣦⣴⠟⠀⠀⠀⠀⠻⣦⣴⠟⠀⠀⠀⠀⠻⣧⡀⠀⠀',
    '⠀⠰⣿⡏⠀⠀⠀⠀⠀⠀⣀⣤⣄⠀⢤⡤⠀⣠⣤⣀⠀⠀⠀⠀⠀⠀⢹⣿⠆⠀',
    '⠀⠀⠀⠈⠢⣀⠀⠀⣴⣿⣿⡿⢿⣷⠀⠀⣾⡿⢿⣿⣿⣦⠀⠀⣀⠔⠁⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠉⠙⢿⣿⣿⣷⣤⣤⣴⣦⣤⣤⣾⣿⣿⡿⠋⠉⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⠿⣿⣿⣿⣿⠿⠟⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀'
}
vim.g.startify_custom_header = [[
    startify#center(g:raccoon) + startify#center(startify#fortune#boxed())]]

local map = vim.api.nvim_set_keymap

-- Format json
map('n', '<leader>fj', ':%!jq<CR>', { noremap = true })

-- Telescope remaps
map('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files({no_ignore=true})<CR>]], { noremap  = true })
map('n', '<C-p>', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true })
map('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], { noremap = true })
map('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], { noremap = true })
map('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], { noremap = true })
map('n', '<leader>fv', [[<cmd>lua require('telescope.builtin').find_files({search_dirs={"~/dotfiles"}, hidden=true})<cr>]], { noremap = true })
map('n', 'gr', [[<cmd>lua require('telescope.builtin').lsp_references()<cr>]], { noremap = true })

-- NvimTree remaps
map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { noremap = true })
map('n', '<leader>r', ':NvimTreeRefresh<CR>', { noremap = true })
map('n', '<leader>n', ':NvimTreeFindFile<CR>', { noremap = true })

-- Test Remaps
map('n', '<leader>t', ':TestNearest<CR>', { silent = true })
map('n', '<leader>T', ':TestFile<CR>', { silent = true })
map('n', '<leader>a', ':TestSuite<CR>', { silent = true })
map('n', '<leader>l', ':TestLast<CR>', { silent = true })
map('n', '<leader>g', ':TestVisit<CR>', { silent = true })

-- Tmux Remaps
map('n', '<C-h>', ':TmuxNavigateLeft<CR>', { silent = true })
map('n', '<C-j>', ':TmuxNavigateDown<CR>', { silent = true })
map('n', '<C-k>', ':TmuxNavigateUp<CR>', { silent = true })
map('n', '<C-l>', ':TmuxNavigateRight<CR>', { silent = true })
-- nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

vim.cmd([[
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

]])

function SourceIfExists(filename)
    local f = io.open(filename, "r")
    if f ~= nil then
        io.close(f)
        vim.cmd("source " .. filename)
    end
end

SourceIfExists(os.getenv("HOME").."/.work.vim")

require('Comment').setup()
require('nvim-web-devicons').setup { default = true; }
require('telescope').setup()
require('telescope').load_extension('fzf')
require('lualine').setup {
  options = {
    theme = 'gruvbox',
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1
      }
    }
  }
}

require('nvim-tree').setup {
    auto_reload_on_write = true,
    diagnostics = {
        enable = true,
    },
    renderer = {
        group_empty = true,
    },
    update_focused_file = {
        enable = true,
    },
    filesystem_watchers = {
        enable = true
    },
    view = {
        adaptive_size = true,
        number = true,
        relativenumber = true
    }
}


local cmp = require "cmp"
local cmp_nvim_lsp = require "cmp_nvim_lsp"
local lspconfig = require "lspconfig"

-- Include the servers you want to have installed by default below
local servers = {
  "bashls",
  "gopls",
  "jdtls",
  "jedi_language_server",
  "pylsp",
  "sumneko_lua",
  "tsserver",
  "vimls",
  "yamlls",
  "zk"
}

require("mason").setup()
require("mason-lspconfig").setup({
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
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local buf_map = vim.api.nvim_buf_set_keymap
  buf_map(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_map(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_map(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_map(bufnr, 'n', 'gk', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_map(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_map(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_map(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_map(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_map(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_map(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
 --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_map(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local capabilities = cmp_nvim_lsp.update_capabilities(
    vim.lsp.protocol.make_client_capabilities())

for _, name in ipairs(servers) do
  lspconfig[name].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end
