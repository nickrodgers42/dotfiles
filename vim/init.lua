local raccoon = {
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

local vim_opts = {
    autoindent = true,
    backspace = "indent,eol,start",
    backup = false,
    colorcolumn = "80,120",
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
    spelllang = "en_us",
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
local set_opts = function(opts)
    for k, v in pairs(opts) do
        vim.opt[k] = v
    end
end
set_opts(vim_opts)
-- Tables can't store nil values
vim.opt.guicursor = nil
vim.opt.mouse = nil
vim.g.vimwiki_list = {
    {
        listsyms = ' ○◐●✓',
        listsyms_rejected='✗'
    }
}

vim.g.mapleader = " "

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
    'numToStr/Comment.nvim',
    'stevearc/aerial.nvim',
    'goolord/alpha-nvim',
    'famiu/bufdelete.nvim',
    'saadparwaiz1/cmp_luasnip',
    -- 'zbirenbaum/copilot.lua',
    -- 'zbirenbaum/copilot-cmp',
    'rafamadriz/friendly-snippets',
    'lewis6991/gitsigns.nvim',
    'nmac427/guess-indent.nvim',
    'onsails/lspkind.nvim',
    'nvim-lualine/lualine.nvim',
    'Shatur/neovim-session-manager',
    'jose-elias-alvarez/null-ls.nvim',
    'mfussenegger/nvim-jdtls',
    'mrded/nvim-lsp-notify',
    'rcarriga/nvim-notify',
    'windwp/nvim-ts-autotag',
    'tpope/vim-fugitive',
    'psliwka/vim-smoothie',
    'vim-test/vim-test',
    'christoomey/vim-tmux-navigator',
    'preservim/vimux',
    'vimwiki/vimwiki',
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {}
    },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme catppuccin]])
        end,
    },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },
    {
        'L3MON4D3/LuaSnip',
        build = "make install_jsregexp"
    },

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

local default_setup = {
    'Comment',
    -- 'colorizer',
    -- 'copilot_cmp',
    'dapui',
    'gitsigns',
    'guess-indent',
    'ibl',
    'mason',
    'nvim-dap-virtual-text',
    'telescope',
    'which-key',
}
for _, package in ipairs(default_setup) do
    require(package).setup()
end


local servers = {
    "bashls",
    "gopls",
    "jdtls",
    "kotlin_language_server",
    "pylsp",
    "rust_analyzer",
    "smithy_ls",
    "lua_ls",
    "tsserver",
    "vimls",
    "yamlls",
    "wgsl_analyzer",
    "zk"
}

require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true
})


local parsers = {
    "bash",
    "java",
    "javascript",
    "kotlin",
    "lua",
    "rust",
    "python",
    "rust",
    "smithy",
    "typescript",
    "vimdoc",
}
require('nvim-treesitter.configs').setup({
    autotag = {
        enable = true,
    },
    ensure_installed = parsers,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    }
})

local debuggers = {
    "java-debug-adapter",
    "java-test"
}
require("mason-nvim-dap").setup({
    ensure_installed = debuggers
})

vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {})
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {})
vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true, silent = true })

local map = vim.api.nvim_set_keymap
local nmap = function(mapping, command, opts)
    opts = opts or { noremap = true, silent = true }
    map('n', mapping, ':' .. command .. '<CR>', opts)
end

local nmaps = {
    { '<C-h>',      'TmuxNavigateLeft' },
    { '<C-j>',      'TmuxNavigateDown' },
    { '<C-k>',      'TmuxNavigateUp' },
    { '<C-l>',      'TmuxNavigateRight' },
    { '<C-n>',      'NvimTreeToggle' },
    { '<C-p>',      'lua require("telescope.builtin").find_files()' },
    { '<leader>B',  'lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))' },
    { '<leader>a',  'AerialToggle!' },
    { '<leader>b',  'lua require("dap").toggle_breakpoint()' },
    { '<leader>dd', 'lua require("dap").continue()' },
    { '<leader>di', 'lua require("dap").step_into()' },
    { '<leader>dl', 'lua require("dap").run_last()' },
    { '<leader>dn', 'lua require("dap").step_over()' },
    { '<leader>do', 'lua require("dapui").toggle()' },
    { '<leader>dp', 'lua require("dap").step_out()' },
    { '<leader>dq', 'lua require("dap").terminate()' },
    { '<leader>dr', 'lua require("dap").repl.open()' },
    { '<leader>e',  'lua vim.diagnostic.open_float()' },
    { '<leader>fa', 'lua require("telescope").extensions.aerial.aerial()' },
    { '<leader>fb', 'lua require("telescope.builtin").buffers()' },
    { '<leader>ff', 'lua require("telescope.builtin").find_files({no_ignore=true})' },
    { '<leader>fg', 'lua require("telescope.builtin").live_grep()' },
    { '<leader>fh', 'lua require("telescope.builtin").help_tags()' },
    { '<leader>fj', '%!jq' },
    { '<leader>fv', 'lua require("telescope.builtin").find_files({search_dirs={"~/dotfiles"}, hidden=true})' },
    { '<leader>lp', 'lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))' },
    { '<leader>n',  'NvimTreeFindFile' },
    { '<leader>q',  'lua vim.diagnostic.setloclist()' },
    { '<leader>tT', 'TestFile' },
    { '<leader>ta', 'TestSuite' },
    { '<leader>tg', 'TestVisit' },
    { '<leader>tl', 'TestLast' },
    { '<leader>tt', 'TestNearest' },
    { '<leader>lt', 'VimwikiListToggle' },
    { '<leader>li', 'VimwikiToggleListItem' },
    { '<leader>lii', 'VimwikiIncrementListItem' },
    { '<leader>lid', 'VimwikiDecrementListItem' },
    { '[d',         'lua vim.diagnostic.goto_prev()' },
    { ']d',         'lua vim.diagnostic.goto_next()' },
    { 'gr',         'lua require("telescope.builtin").lsp_references()' },
}
for _, keymap in ipairs(nmaps) do
    nmap(unpack(keymap))
end

local signs = {
    { 'DapBreakpoint',          { text = '', texthl = 'DapBreakpoint', linehl = '', numhl = '' } },
    { 'DapBreakpointCondition', { text = '', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' } },
    { 'DapBreakpointRejected',  { text = '', texthl = 'DapBreakpointRejected', linehl = '', numhl = '' } },
    { 'DapLogPoint',            { text = '', texthl = 'DapLogPoint', linehl = '', numhl = '' } },
    { 'DapStopped',             { text = '', texthl = 'DapStopped', linehl = '', numhl = '' } },
    { 'DiagnosticSignError',    { text = '', texthl = 'DiagnosticSignError' } },
    { 'DiagnosticSignHint',     { text = '', texthl = 'DiagnosticSignHint' } },
    { 'DiagnosticSignInfo',     { text = '', texthl = 'DiagnosticSignInfo' } },
    { 'DiagnosticSignWarn',     { text = '', texthl = 'DiagnosticSignWarn' } },
}
for _, sign in ipairs(signs) do
    vim.fn.sign_define(unpack(sign))
end

require('nvim-web-devicons').setup { default = true, }
require("catppuccin").setup({
    flavour = "frappe",
    transparent_background = true,
    integrations = {
        aerial = true,
        cmp = true,
        dap = {
            enabled = true,
            enable_ui = true, -- enable nvim-dap-ui
        },
        gitgutter = true,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = true
        },
        mason = true,
        notify = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        vimwiki = true,
        which_key = true,
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

vim.g.tmux_navigator_no_mappings = 1
vim.g["test#strategy"] = 'vimux'
vim.g["test#python#runner"] = 'pytest'
vim.g["test#python#command"] = 'python3 -m pytest'
vim.g.VimuxOrientation = "h"

local highlight_whitespace = vim.api.nvim_create_augroup('highlight_whitespace', { clear = true })
vim.api.nvim_create_autocmd({ 'BufWinEnter', 'InsertLeave', 'InsertEnter', 'BufWinLeave' }, {
    group = highlight_whitespace,
    callback = function(ev)
        vim.schedule(function()
            if (vim.bo.filetype == 'help' or vim.fn.expand("%p") == '') then
                return
            end
            vim.fn.clearmatches()
            if (ev.event == 'InsertEnter') then
                vim.fn.matchadd("Error", [[\s\+\%#\@<!$]])
            elseif (ev.event ~= 'BufWinLeave') then
                vim.fn.matchadd("Error", [[\s\+$]])
            end
        end)
    end,
})

local html_tab = vim.api.nvim_create_augroup('html_tab', { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "*.html", "*.jsx", "*.tsx" },
    group = html_tab,
    callback = function()
        set_opts({
            tabstop = 2,
            shiftwidth = 2,
            softtabstop = 2,
        })
    end
})

function SourceIfExists(filename)
    local f = io.open(filename, "r")
    if f ~= nil then
        io.close(f)
        vim.cmd("source " .. filename)
    end
end

SourceIfExists(os.getenv("HOME") .. "/.work.lua")

require('telescope').load_extension('fzf')
require('telescope').load_extension('aerial')

require("notify").setup({
    background_colour = "#000000",
})
vim.notify = require('notify')
-- require('lsp-notify').setup({})

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
            },
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
        },
        placement = "edge"
    },
    attach_mode = "global",
    show_guides = true,
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


local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

-- require("copilot").setup({
--     suggestion = { enabled = false },
--     panel = { enabled = false },
-- })

local cmp = require "cmp"
local lspconfig = require "lspconfig"
local lspkind = require('lspkind')

-- Include the servers you want to have installed by default below
cmp.setup({
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 60,
            ellipsis_char = '...',
            symbol_map = { Copilot = '' }
        })
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
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
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        }),
        ["<Tab>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
            else
                fallback()
            end
        end)
    },
    sources = cmp.config.sources({
        -- { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "luasnip" }
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

local buf_map = function(bufnr, mapping, command, opts)
    opts = opts or { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', mapping, ':' .. command .. '<CR>', opts)
end

local buf_maps = {
    { '<leader>D',  'lua vim.lsp.buf.type_definition()' },
    { '<leader>ca', 'lua vim.lsp.buf.code_action()' },
    { '<leader>f',  'lua vim.lsp.buf.format { async = true }' },
    { '<leader>rn', 'lua vim.lsp.buf.rename()' },
    { '<leader>wa', 'lua vim.lsp.buf.add_workspace_folder()' },
    { '<leader>wl', 'lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))' },
    { '<leader>wr', 'lua vim.lsp.buf.remove_workspace_folder()' },
    { 'K',          'lua vim.lsp.buf.hover()' },
    { 'gD',         'lua vim.lsp.buf.declaration()' },
    { 'gd',         'lua vim.lsp.buf.definition()' },
    { 'gi',         'lua vim.lsp.buf.implementation()' },
    { 'gk',         'lua vim.lsp.buf.signature_help()' },
}

MapLspCommands = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

    for _, keymap in ipairs(buf_maps) do
        buf_map(bufnr, unpack(keymap))
    end
end

local on_attach = function(client, bufnr)
    MapLspCommands(client, bufnr)
end

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(event)
        MapLspCommands(_, event.buf)
    end
})

local cmp_nvim_lsp = require("cmp_nvim_lsp")
cmp_nvim_lsp.setup {
    sources = {
        name = 'nvim_lsp'
    }
}
local capabilities = cmp_nvim_lsp.default_capabilities()

for _, name in ipairs(servers) do
    lspconfig[name].setup {
        capabilities = capabilities
    }
end

lspconfig.glsl_analyzer.setup{}

lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ["rust_analyzer"] = {
            diagnostics = {
                enable = true,
                experimental = {
                    enable = true
                }
            }
        }
    }
}

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

local session_manager_config = require('session_manager.config')
require('session_manager').setup({
    autoload_mode = session_manager_config.AutoloadMode.Disabled,
})

vim.api.nvim_create_user_command("ShowHighlights", ":so $VIMRUNTIME/syntax/hitest.vim", {})
local function configureAlpha()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    local startify = require 'alpha.themes.startify'
    local fortune = require 'alpha.fortune' ()
    dashboard.section.header = {
        type = "text",
        opts = {
            position = "center",
            hl = 'Title'
        },
        val = raccoon
    }
    dashboard.section.buttons.val = {
        dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
        dashboard.button("sc", "󰦛" .. " Restore cwd session", [[:SessionManager load_current_dir_session<CR>]]),
        dashboard.button("sl", "󰦛" .. " Restore last session", [[:SessionManager load_last_session<CR>]]),
        dashboard.button("l", "" .. " Lazy", ":Lazy<CR>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    }
    dashboard.config.layout = {
        dashboard.section.header,
        { type = "text",    val = fortune, opts = { position = 'center', hl = 'Title' } },
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 1 },
        startify.section.mru_cwd,
        { type = "padding", val = 1 },
        startify.section.mru,
    }
    alpha.setup(dashboard.config)
end
configureAlpha()

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.formatting.prettier
    },
    on_attach=on_attach
})

local in_wsl = os.getenv('WSL_DISTRO_NAME') ~= nil

if in_wsl then
    vim.g.clipboard = {
        name = 'wsl clipboard',
        copy = { ["+"] = { "clip.exe" },["*"] = { "clip.exe" } },
        paste = { ["+"] = { "nvim_paste" },["*"] = { "nvim_paste" } },
        cache_enabled = true
    }
end

vim.cmd [[
" Recognize glsl
au BufNewFile,BufRead *.frag set filetype=glsl
au BufNewFile,BufRead *.vert set filetype=glsl
]]
