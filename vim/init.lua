local vim_opts = {
    autoindent = true,
    backspace = "indent,eol,start",
    backup = false,
    colorcolumn = "80",
    confirm = true,
    cursorline = true,
    errorbells = false,
    expandtab = true,
    hlsearch = true,
    ignorecase = true,
    incsearch = true,
    laststatus = 2,
    list = true,
    listchars = { space = '⋅', tab = '⋅⋅»' },
    number = true,
    relativenumber = true,
    ruler = true,
    scrolloff = 8,
    shiftwidth = 4,
    showcmd = true,
    signcolumn = "yes",
    smartcase = true,
    smartindent = true,
    softtabstop = 4,
    startofline = false,
    swapfile = false,
    tabstop = 4,
    termguicolors = true,
    ttimeoutlen = 100,
    undofile = true,
    updatetime = 50,
    visualbell = true,
    wildmenu = true,
    wrap = false,
    writebackup = false,
}
for k, v in pairs(vim_opts) do
    vim.opt[k] = v
end
-- Tables can't store nil values
vim.opt.guicursor = nil
vim.opt.mouse = nil

vim.g.mapleader = " "
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {})
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {})
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- General Plugins
    'christoomey/vim-tmux-navigator',
    'numToStr/Comment.nvim',
    'nvim-lualine/lualine.nvim',
    'preservim/nerdcommenter',
    'psliwka/vim-smoothie',
    'tpope/vim-fugitive',
    'vimwiki/vimwiki',
    'mhinz/vim-startify',
    'lukas-reineke/indent-blankline.nvim',
    'mfussenegger/nvim-jdtls',
    'vim-test/vim-test',
    'preservim/vimux',
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme catppuccin]])
        end,
    },
    'lbrayner/vim-rzip',
    'rcarriga/nvim-notify',
    'lewis6991/gitsigns.nvim',
    'stevearc/aerial.nvim',
    'nmac427/guess-indent.nvim',

    -- Telescope
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate"
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },

    -- nvim-tree
    'kyazdani42/nvim-web-devicons',
    'kyazdani42/nvim-tree.lua',

    -- lsp stuff
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- nvim-cmp
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/nvim-cmp',
    'hrsh7th/vim-vsnip',

    -- nvim-dap
    'jayp0521/mason-nvim-dap.nvim',
    'mfussenegger/nvim-dap',
    'theHamsta/nvim-dap-virtual-text',
    'rcarriga/nvim-dap-ui',
}
require('lazy').setup(plugins)

require('nvim-web-devicons').setup { default = true, }
require("catppuccin").setup({
    flavour = "frappe",
    transparent_background = true,
    integrations = {
        aerial = true,
        dap = {
            enabled = true,
            enable_ui = true, -- enable nvim-dap-ui
        },
        gitgutter = true,
        mason = true,
        notify = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
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

vim.cmd.colorscheme "catppuccin"
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
    '⠀⠀⠀⠀⠀⣿⠀⠀⣿⠟⠉⠉⠀⠀⠀⠀⠀⠀⠉⠉⠻⣿⠀⠀⣿⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⣿⠀⣾⠋⠀⣀⣀⠀⠀⠀⠀⠀⠀⣀⣀⠀⠙⣷⠀⣿⠀⠀⠀⠀⠀',
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
    opts = opts or { noremap = true, silent = true }
    map('n', mapping, ':' .. command .. '<CR>', opts)
end

-- Format json
nmap('<leader>fj', '%!jq')

-- Telescope remaps
nmap('<leader>ff', 'lua require("telescope.builtin").find_files({no_ignore=true})')
nmap('<leader>fa', 'lua require("telescope").extensions.aerial.aerial()')
nmap('<C-p>', 'lua require("telescope.builtin").find_files()')
nmap('<leader>fg', 'lua require("telescope.builtin").live_grep()')
nmap('<leader>fb', 'lua require("telescope.builtin").buffers()')
nmap('<leader>fh', 'lua require("telescope.builtin").help_tags()')
nmap('<leader>fv',
    'lua require("telescope.builtin").find_files({search_dirs={"~/dotfiles"}, hidden=true})')
nmap('gr', 'lua require("telescope.builtin").lsp_references()')

-- NvimTree remaps
nmap('<C-n>', 'NvimTreeToggle')
nmap('<leader>n', 'NvimTreeFindFile')

nmap('<leader>a', 'AerialToggle!')

-- Test Remaps
nmap('<leader>tt', 'TestNearest')
nmap('<leader>tT', 'TestFile')
nmap('<leader>ta', 'TestSuite')
nmap('<leader>tl', 'TestLast')
nmap('<leader>tg', 'TestVisit')

-- Tmux Remaps
nmap('<C-h>', 'TmuxNavigateLeft')
nmap('<C-j>', 'TmuxNavigateDown')
nmap('<C-k>', 'TmuxNavigateUp')
nmap('<C-l>', 'TmuxNavigateRight')

-- nvim-dap remaps
nmap('<leader>dd', 'lua require("dap").continue()')
nmap('<leader>dn', 'lua require("dap").step_over()')
nmap('<leader>di', 'lua require("dap").step_into()')
nmap('<leader>dp', 'lua require("dap").step_out()')
nmap('<leader>b', 'lua require("dap").toggle_breakpoint()')
nmap('<leader>B', 'lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))')
nmap('<leader>lp', 'ua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))')
nmap('<leader>dr', 'lua require("dap").repl.open()')
nmap('<leader>dl', 'lua require("dap").run_last()')
nmap('<leader>dq', 'lua require("dap").terminate()')
nmap('<leader>do', 'lua require("dapui").toggle()')
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

local default_setup = {
    'Comment',
    'dapui',
    'gitsigns',
    'guess-indent',
    'mason',
    'nvim-dap-virtual-text',
    'telescope',
}
for _, package in ipairs(default_setup) do
    require(package).setup()
end

require('telescope').load_extension('fzf')
require('telescope').load_extension('aerial')
require("notify").setup({
    background_colour = "#000000",
})
vim.notify = require('notify')
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
        },
        lualine_x = { "aerial" },
        lualine_y = { "encoding", 'fileformat', 'filetype' },
        lualine_z = { 'progress', 'location' }
    }
}

require('aerial').setup({
    layout = {
        width = 30,
        win_opts = {
            number = true,
            relativenumber = true
        }
    },
    show_guides = true
})

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
nmap('<leader>e', 'lua vim.diagnostic.open_float()')
nmap('[d', 'lua vim.diagnostic.goto_prev()')
nmap(']d', 'lua vim.diagnostic.goto_next()')
nmap('<leader>q', 'lua vim.diagnostic.setloclist()')

local buf_map = function(bufnr, mapping, command, opts)
    opts = opts or { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', mapping, ':' .. command .. '<CR>', opts)
end

MapLspCommands = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_map(bufnr, 'gD', 'lua vim.lsp.buf.declaration()')
    buf_map(bufnr, 'gd', 'lua vim.lsp.buf.definition()')
    buf_map(bufnr, 'K', 'lua vim.lsp.buf.hover()')
    buf_map(bufnr, 'gi', 'lua vim.lsp.buf.implementation()')
    buf_map(bufnr, 'gk', 'lua vim.lsp.buf.signature_help()')
    buf_map(bufnr, '<leader>wa', 'lua vim.lsp.buf.add_workspace_folder()')
    buf_map(bufnr, '<leader>wr', 'lua vim.lsp.buf.remove_workspace_folder()')
    buf_map(bufnr, '<leader>wl', 'lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))')
    buf_map(bufnr, '<leader>D', 'lua vim.lsp.buf.type_definition()')
    buf_map(bufnr, '<leader>rn', 'lua vim.lsp.buf.rename()')
    buf_map(bufnr, '<leader>ca', 'lua vim.lsp.buf.code_action()')
    buf_map(bufnr, '<leader>f', 'lua vim.lsp.buf.format { async = true }')
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
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
            format = {
                enable = true,
                defaultConfig = {
                    indent_style = "space",
                    indent_size = "2",
                },
            },
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
