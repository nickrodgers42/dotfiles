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
vim.opt.listchars = { space = '⋅', tab = '⋅⋅»' }
vim.opt.list = true
vim.opt.mouse = nil


local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
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
    use 'lbrayner/vim-rzip'

    -- Telescope
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use { 'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end }
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
filetype plugin on
highlight Normal guibg=none
]])

vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_bufname_exclude = { '' }
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
vim.g.startify_change_to_dir = 0
vim.g.startify_change_to_vcs_root = 1

local map = vim.api.nvim_set_keymap
local nmap = function(mapping, command, opts)
    if (opts == nil) then
        opts = {}
    end
    if (opts['noremap'] == nil) then
        opts['noremap'] = true
    end
    if (opts['silent'] == nil) then
        opts['silent'] = true
    end
    map('n', mapping, command, opts)
end

-- Format json
nmap('<leader>fj', ':%!jq<CR>')

-- Telescope remaps
nmap('<leader>ff', [[:lua require('telescope.builtin').find_files({no_ignore=true})<CR>]])
nmap('<C-p>', [[:lua require('telescope.builtin').find_files()<cr>]])
nmap('<leader>fg', [[:lua require('telescope.builtin').live_grep()<cr>]])
nmap('<leader>fb', [[:lua require('telescope.builtin').buffers()<cr>]])
nmap('<leader>fh', [[:lua require('telescope.builtin').help_tags()<cr>]])
nmap('<leader>fv',
    [[:lua require('telescope.builtin').find_files({search_dirs={"~/dotfiles"}, hidden=true})<cr>]])
nmap('gr', [[:lua require('telescope.builtin').lsp_references()<cr>]])

-- NvimTree remaps
nmap('<C-n>', ':NvimTreeToggle<CR>')
-- map('n', '<C-n>', ':NvimTreeToggle<CR>')
nmap('<leader>n', ':NvimTreeFindFile<CR>')

-- Test Remaps
nmap('<leader>t', ':TestNearest<CR>')
nmap('<leader>T', ':TestFile<CR>')
nmap('<leader>a', ':TestSuite<CR>')
nmap('<leader>l', ':TestLast<CR>')
nmap('<leader>g', ':TestVisit<CR>')

-- Tmux Remaps
nmap('<C-h>', ':TmuxNavigateLeft<CR>')
nmap('<C-j>', ':TmuxNavigateDown<CR>')
nmap('<C-k>', ':TmuxNavigateUp<CR>')
nmap('<C-l>', ':TmuxNavigateRight<CR>')
-- nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

-- nvim-dap remaps
nmap('<leader>dd', [[:lua require'dap'.continue()<CR>]])
nmap('<leader>dn', [[:lua require'dap'.step_over()<CR>]])
nmap('<leader>di', [[:lua require'dap'.step_into()<CR>]])
nmap('<leader>dp', [[:lua require'dap'.step_out()<CR>]])
nmap('<leader>b',  [[:lua require'dap'.toggle_breakpoint()<CR>]])
nmap('<leader>B',  [[:lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]])
nmap('<leader>lp', [[:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]])
nmap('<leader>dr', [[:lua require'dap'.repl.open()<CR>]])
nmap('<leader>dl', [[:lua require'dap'.run_last()<CR>]])
nmap('<leader>dq', [[:lua require'dap'.terminate()<CR>]])
nmap('<leader>do', [[:lua require'dapui'.toggle()<CR>]])
vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '⭕', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = '✏️', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '➡️', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '❌', texthl = '', linehl = '', numhl = '' })
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

SourceIfExists(os.getenv("HOME") .. "/.work.lua")

require('Comment').setup()
require('nvim-web-devicons').setup { default = true; }
require('telescope').setup()
require('telescope').load_extension('fzf')
require('nvim-dap-virtual-text').setup()
require('dapui').setup()
require('lualine').setup {
    options = {
        theme = 'catppuccin',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' }
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
        width = {
            max = 60
        },
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
    "kotlin_language_server",
    "pylsp",
    "smithy_ls",
    "lua_ls",
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
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ["<C-c>"] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ["<C-y>"] = cmp.config.disable,
        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp.mapping.confirm(),
        ["<Tab>"] = cmp.mapping.confirm({ select = true })
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
local opts = { noremap = true, silent = true }
nmap('<leader>e', ':lua vim.diagnostic.open_float()<CR>', opts)
nmap('[d', ':lua vim.diagnostic.goto_prev()<CR>', opts)
nmap(']d', ':lua vim.diagnostic.goto_next()<CR>', opts)
nmap('<leader>q', ':lua vim.diagnostic.setloclist()<CR>', opts)

MapLspCommands = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local buf_map = vim.api.nvim_buf_set_keymap
    buf_map(bufnr, 'n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts)
    buf_map(bufnr, 'n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
    buf_map(bufnr, 'n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
    buf_map(bufnr, 'n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
    buf_map(bufnr, 'n', 'gk', ':lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_map(bufnr, 'n', '<leader>wa', ':lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_map(bufnr, 'n', '<leader>wr', ':lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_map(bufnr, 'n', '<leader>wl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_map(bufnr, 'n', '<leader>D', ':lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_map(bufnr, 'n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>', opts)
    buf_map(bufnr, 'n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>', opts)
    --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
    buf_map(bufnr, 'n', '<leader>f', ':lua vim.lsp.buf.format { async = true }<CR>', opts)
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

lspconfig.lua_ls.setup {
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

vim.cmd([[au BufRead,BufNewFile *.smithy		setfiletype smithy]])
local parsers = {
    "bash",
    "java",
    "javascript",
    "kotlin",
    "lua",
    "python",
    "typescript",
    "smithy",
}
require('nvim-treesitter.configs').setup({
    ensure_installed = parsers,
    highlight = {
        enable = true,
    }
})
