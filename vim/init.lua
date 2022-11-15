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
vim.opt.cursorline = true

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
  use 'vimwiki/vimwiki'
  use 'mhinz/vim-startify'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'mfussenegger/nvim-jdtls'
  use 'vim-test/vim-test'
  use 'preservim/vimux'
  use { 'catppuccin/nvim', as = 'catppuccin' }

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = function() require('nvim-treesitter.install').update({ with_sync = true }) end }
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

  -- nvim-dap
  use 'jayp0521/mason-nvim-dap.nvim'
  use 'mfussenegger/nvim-dap'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'rcarriga/nvim-dap-ui'

  if packer_bootstrap then
    require('packer').sync()
  end
end)

vim.cmd([[
" colorscheme gruvbox
highlight Normal guibg=none
filetype plugin on
]])

vim.cmd.colorscheme "catppuccin"

require("catppuccin").setup({
    flavour = "frappe",
    transparent_background = true,
    integrations = {
        dap = {
            enabled = true,
            enable_ui = true, -- enable nvim-dap-ui
        },
        nvimtree = true,
        telescope = true,
        treesitter = true,
        mason = true,
        gitgutter = true,
        vimwiki = true
    },
    custom_highlights = function(colors)
        return {
            SignColumn = { fg = colors.overlay1 },
            Comment = { fg = colors.overlay1 },
            LineNr = { fg = colors.overlay1 },
            VertSplit = {
                bg = colors.surface2,
                fg = colors.surface2
            },
            NvimTreeVertSplit = {
                bg = colors.surface2,
                fg = colors.surface2
            }
        }
    end
})
vim.cmd([[
highlight Normal guibg=none
]])


vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_bufname_exclude = {''}
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

-- nvim-dap remaps
map('n', '<Leader>dd', [[:lua require'dap'.continue()<CR>]], { noremap = true, silent = true })
map('n', '<Leader>dn', [[:lua require'dap'.step_over()<CR>]], { noremap = true, silent = true })
map('n', '<Leader>di', [[:lua require'dap'.step_into()<CR>]], { noremap = true, silent = true })
map('n', '<Leader>dp', [[:lua require'dap'.step_out()<CR>]], { noremap = true, silent = true })
map('n', '<Leader>b', [[:lua require('dap').toggle_breakpoint()<CR>]], { noremap = true, silent = true })
map('n', '<Leader>B', [[:lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]], { noremap = true, silent = true })
map('n', '<Leader>lp', [[:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]], { noremap = true, silent = true })
map('n', '<Leader>dr', [[:lua require'dap'.repl.open()<CR>]], { noremap = true, silent = true })
map('n', '<Leader>dl', [[:lua require'dap'.run_last()<CR>]], { noremap = true, silent = true })
map('n', '<Leader>dq', [[:lua require'dap'.terminate()<CR>]], { noremap = true, silent = true })
map('n', '<Leader>do', [[:lua require('dapui').toggle()<CR>]], { noremap = true, silent = true })
vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='⭕', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='✏️', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='➡️', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='❌', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

vim.cmd([[
augroup HIGHLIGHT_WHITESPACE
    autocmd!
    autocmd BufWinEnter * if &ft != 'help' && expand('%p') != '' | match Error /\s\+$/ | endif
    autocmd InsertEnter * if &ft != 'help' && expand('%p') != '' | match Error /\s\+\%#\@<!$/ | endif
    autocmd InsertLeave * if &ft != 'help' && expand('%p') != '' | match Error /\s\+$/ | endif
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
require('nvim-dap-virtual-text').setup()
require('dapui').setup()
require('lualine').setup {
  options = {
    theme = 'catppuccin',
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
local lspconfig = require "lspconfig"

-- Include the servers you want to have installed by default below
local servers = {
  "bashls",
  "gopls",
  "jdtls",
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

MapLspCommands = function(client, bufnr)
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

local on_attach = function(client, bufnr)
    MapLspCommands(client, bufnr)
end


local cmp_nvim_lsp = require("cmp_nvim_lsp")
cmp_nvim_lsp.setup {
    sources = {
        name = 'nvim_lsp'
    }
}
local capabilities = cmp_nvim_lsp.default_capabilities()

for _, name in ipairs(servers) do
  lspconfig[name].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end

lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}
lspconfig.pylsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = {},
                    maxLineLength = 120,
                },
                rope_autoimport = {
                    enabled = true
                }
            }
        }
    }
}

local debuggers = {
    "java-debug-adapter",
    "java-test"
}

require("mason-nvim-dap").setup({
    ensure_installed = debuggers
})

local parsers = {
    "bash",
    "java",
    "javascript",
    "kotlin",
    "lua",
    "python",
    "typescript",
}
require('nvim-treesitter.configs').setup({
    ensure_installed = parsers,
    highlight = {
        enable = true,
    }
})
