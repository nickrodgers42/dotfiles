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
    splitright = true,
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
vim.opt.guicursor = ''
vim.opt.mouse = ''
vim.g.vimwiki_list = {
    {
        listsyms = ' ○◐●✓',
        listsyms_rejected = '✗'
    }
}
vim.g.vimwiki_global_ext = 0

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
    'davidsierradz/cmp-conventionalcommits',
    'numToStr/Comment.nvim',
    'goolord/alpha-nvim',
    'famiu/bufdelete.nvim',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
    'nmac427/guess-indent.nvim',
    'onsails/lspkind.nvim',
    'Shatur/neovim-session-manager',
    {
        'nvimtools/none-ls.nvim',
        dependencies = {
            "nvimtools/none-ls-extras.nvim",
        }
    },
    'mfussenegger/nvim-jdtls',
    'mrded/nvim-lsp-notify',
    'rcarriga/cmp-dap',
    'rcarriga/nvim-notify',
    'windwp/nvim-ts-autotag',
    'tpope/vim-fugitive',
    'tpope/vim-abolish',
    'psliwka/vim-smoothie',
    'christoomey/vim-tmux-navigator',
    'preservim/vimux',
    'vimwiki/vimwiki',

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
    {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {},
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    },
    {
        'stevearc/aerial.nvim',
        opts = {
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
        }
    },
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']c', function()
                    if vim.wo.diff then return ']c' end
                    vim.schedule(function() gs.next_hunk() end)
                    return '<Ignore>'
                end, { expr = true })

                map('n', '[c', function()
                    if vim.wo.diff then return '[c' end
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end, { expr = true })

                -- Actions
                map('n', '<leader>hs', gs.stage_hunk)
                map('n', '<leader>hr', gs.reset_hunk)
                map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
                map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
                map('n', '<leader>hS', gs.stage_buffer)
                map('n', '<leader>hu', gs.undo_stage_hunk)
                map('n', '<leader>hR', gs.reset_buffer)
                map('n', '<leader>hp', gs.preview_hunk)
                map('n', '<leader>hb', function() gs.blame_line { full = true } end)
                map('n', '<leader>tb', gs.toggle_current_line_blame)
                map('n', '<leader>hd', gs.diffthis)
                map('n', '<leader>hD', function() gs.diffthis('~') end)
                map('n', '<leader>td', gs.toggle_deleted)

                -- Text object
                map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
            end
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        opts = {
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
                lualine_x = { "aerial", },
                lualine_y = { "encoding", 'fileformat', 'filetype' },
                lualine_z = { 'progress', 'location' }
            }
        }
    },
    { 'echasnovski/mini.surround', version = '*' },
    { 'echasnovski/mini.icons', version = '*' },
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
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme "catppuccin"
        end,
        opts = {
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
                    NonText = { fg = colors.surface1 },
                    SignColumn = { fg = colors.overlay1 },
                    Comment = { fg = colors.overlay0 },
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
        }
    },
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = { },
      keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      },
    },
    {
        'L3MON4D3/LuaSnip',
        build = "make install_jsregexp"
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-python",
        }
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        ft = { 'rust' },
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
    {
        'kyazdani42/nvim-web-devicons',
        opts = {
            default = true
        }
    },
    {
        'kyazdani42/nvim-tree.lua',
        opts = {
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
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
    {
      "folke/trouble.nvim",
      opts = {}, -- for default options, refer to the configuration section for custom setup.
      cmd = "Trouble",
      keys = {
        {
          "<leader>xx",
          "<cmd>Trouble diagnostics toggle<cr>",
          desc = "Diagnostics (Trouble)",
        },
        {
          "<leader>xX",
          "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
          desc = "Buffer Diagnostics (Trouble)",
        },
        {
          "<leader>cs",
          "<cmd>Trouble symbols toggle focus=false<cr>",
          desc = "Symbols (Trouble)",
        },
        {
          "<leader>cl",
          "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
          desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
          "<leader>xL",
          "<cmd>Trouble loclist toggle<cr>",
          desc = "Location List (Trouble)",
        },
        {
          "<leader>xQ",
          "<cmd>Trouble qflist toggle<cr>",
          desc = "Quickfix List (Trouble)",
        },
      },
    },
}
require('lazy').setup(plugins)

local default_setup = {
    'Comment',
    'dapui',
    'gitsigns',
    'guess-indent',
    'ibl',
    'mason',
    'mini.surround',
    'nvim-dap-virtual-text',
    'telescope'
}
for _, package in ipairs(default_setup) do
    require(package).setup()
end

require("neotest").setup {
    adapters = {
        require("rustaceanvim.neotest"),
        require("neotest-python")
    }
}

local language_configs = {
    {
        language_server = "bashls",
        parser = "bash",
    },
    {
        language_server = "elixirls",
        parser = "elixir",
        cmd = { "/Users/nrdg/.local/share/nvim/mason/bin/elixir-ls" }
    },
    {
        language_server = "gopls",
        parser = "go"
    },
    {
        language_server = "jdtls",
        parser = "java",
        debuggers = { "java-debug-adapter", "java-test" },
        autostart = false
    },
    {
        language_server = "kotlin_language_server",
        parser = "kotlin",
    },
    {
        language_server = "lua_ls",
        parser = "lua",
        lspconfig_settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                },
                workspace = {
                    library = {
                        vim.env.VIMRUNTIME
                    }
                },
                telemetry = {
                    enable = false,
                },
                format = {
                    enable = true,
                    defaultConfig = {
                        indent_style = "space",
                    },
                },
            }
        }
    },
    {
        language_server = "pyright",
        parser = "python",
        lspconfig_settings = {
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
    },
    {
        parser = "rust",
    },
    {
        language_server = "smithy_ls",
        parser = "smithy"
    },
    {
        language_server = "ts_ls",
        parser = "typescript",
        lsp_init_options = {
            preferences = {
                includeInlayParameterNameHints = 'all',
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            }
        }
    },
    {
        language_server = "eslint",
    },
    {
        language_server = "yamlls",
        parser = "yaml"
    },
    {
        langauge_server = "wgsl_analyzer",
        parser = "wgsl",
    },
    {
        language_server = "zk",
        parser = "markdown"
    },
    {
        parser = "vimdoc"
    },
    {
        language_server = "rubocop"
    },
    {
        language_server = "solargraph"
    }

}

local buf_map = function(bufnr, mapping, command, opts)
    opts = opts or { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', mapping, ':' .. command .. '<CR>', opts)
end

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
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

-- vim.api.nvim_create_autocmd('LspAttach', {
--     group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--     callback = function(event)
--         MapLspCommands(nil, event.buf)
--     end
-- })

local cmp_nvim_lsp = require("cmp_nvim_lsp")
cmp_nvim_lsp.setup {
    sources = {
        name = 'nvim_lsp'
    }
}
local capabilities = cmp_nvim_lsp.default_capabilities()

local function lsp_on_attach(client, bufnr)
    MapLspCommands(_, bufnr)
end

local function install_language_servers(configs)
    local servers = {}
    local parsers = {}
    local debuggers = {}
    local lspconfig = require("lspconfig")
    for _, config in ipairs(configs) do
        if config.language_server ~= nil then
            table.insert(servers, config.language_server)
            local autostart = true
            if config.autostart ~= nil then
                autostart = config.autostart
            end
            lspconfig[config.language_server].setup {
                on_attach = lsp_on_attach,
                capabilities = capabilities,
                settings = config.lspconfig_settings,
                autostart = autostart,
                cmd = config.cmd,
                init_options = config.lsp_init_options
            }
        end
        if config.parser ~= nil then
            table.insert(parsers, config.parser)
        end
        if config.debuggers ~= nil then
            for _, debugger in ipairs(config.debuggers) do
                table.insert(debuggers, debugger)
            end
        end
    end
    require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_installation = true
    })
    require('nvim-treesitter.configs').setup {
        auto_install = true,
        autotag = {
            enable = true,
        },
        ensure_installed = parsers,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = true
        }
    }
    require("mason-nvim-dap").setup {
        ensure_installed = debuggers,
        automatic_installation = true
    }
end
install_language_servers(language_configs)

vim.g.rustaceanvim = {
    -- Plugin configuration
    tools = {
    },
    -- LSP configuration
    server = {
        on_attach = function(_, bufnr)
            MapLspCommands()
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end,
        default_settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {
                diagnostics = {
                    enable = true,
                    experimental = {
                        enable = true
                    }
                },
            },
        },
    },
    -- DAP configuration
    dap = {
    },
}

vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {})
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {})
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true, silent = true })

local map = vim.api.nvim_set_keymap
local nmap = function(mapping, command, opts)
    opts = opts or { noremap = true, silent = true }
    map('n', mapping, ':' .. command .. '<CR>', opts)
end

local nmaps = {
    { '<C-h>',       'TmuxNavigateLeft' },
    { '<C-j>',       'TmuxNavigateDown' },
    { '<C-k>',       'TmuxNavigateUp' },
    { '<C-l>',       'TmuxNavigateRight' },
    { '<C-n>',       'NvimTreeToggle' },
    { '<C-p>',       'lua require("telescope.builtin").find_files()' },
    { '<leader>B',   'lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))' },
    { '<leader>a',   'AerialToggle!' },
    { '<leader>h',   'lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())' },
    { '<leader>b',   'lua require("dap").toggle_breakpoint()' },
    { '<leader>dd',  'lua require("dap").continue()' },
    { '<leader>di',  'lua require("dap").step_into()' },
    { '<leader>dl',  'lua require("dap").run_last()' },
    { '<leader>dn',  'lua require("dap").step_over()' },
    { '<leader>do',  'lua require("dapui").toggle()' },
    { '<leader>dp',  'lua require("dap").step_out()' },
    { '<leader>dq',  'lua require("dap").terminate()' },
    { '<leader>dr',  'lua require("dap").repl.open()' },
    { '<leader>e',   'lua vim.diagnostic.open_float()' },
    { '<leader>fa',  'lua require("telescope").extensions.aerial.aerial()' },
    { 'leader>fb',  'lua require("telescope.builtin").buffers()' },
    { '<leader>ff',  'lua require("telescope.builtin").find_files({no_ignore=true, hidden=true})' },
    { '<leader>fg',  'lua require("telescope.builtin").live_grep()' },
    { '<leader>fh',  'lua require("telescope.builtin").help_tags()' },
    { '<leader>fj',  '%!jq' },
    { '<leader>fv',  'lua require("telescope.builtin").find_files({search_dirs={"~/dotfiles"}, hidden=true})' },
    { '<leader>lp',  'lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))' },
    { '<leader>n',   'NvimTreeFindFile' },
    { '<leader>q',   'lua vim.diagnostic.setloclist()' },
    { '<leader>tt',  'lua require("neotest").run.run()' },
    { '<leader>tT',  'lua require("neotest").run.run(vim.fn.expand("%"))' },
    { '<leader>ts',  'lua require("neotest").run.run({ suite = true })' },
    { '<leader>tl',  'lua require("neotest").run.run_last()' },
    { '<leader>tq',  'lua require("neotest").run.stop()' },
    { '<leader>to',  'lua require("neotest").output_panel.toggle()' },
    { '<leader>tc',  'lua require("neotest").output_panel.clear()' },
    { '<leader>ts',  'lua require("neotest").summary.toggle()' },
    { '<leader>lt',  'VimwikiListToggle' },
    { '<leader>li',  'VimwikiToggleListItem' },
    { '<leader>lii', 'VimwikiIncrementListItem' },
    { '<leader>lid', 'VimwikiDecrementListItem' },
    { '[d',          'lua vim.diagnostic.goto_prev()' },
    { ']d',          'lua vim.diagnostic.goto_next()' },
    { 'gr',          'lua require("telescope.builtin").lsp_references()' },
}
for _, keymap in ipairs(nmaps) do
    nmap(unpack(keymap))
end

local signs = {
    { 'DapBreakpoint', { text = '', texthl = 'DapBreakpoint', linehl = '', numhl = '' } },
    { 'DapBreakpointCondition', { text = '', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' } },
    { 'DapBreakpointRejected', { text = '', texthl = 'DapBreakpointRejected', linehl = '', numhl = '' } },
    { 'DapLogPoint', { text = '', texthl = 'DapLogPoint', linehl = '', numhl = '' } },
    { 'DapStopped', { text = '', texthl = 'DapStopped', linehl = '', numhl = '' } },
    { 'DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' } },
    { 'DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' } },
    { 'DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' } },
    { 'DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' } },
}
for _, sign in ipairs(signs) do
    vim.fn.sign_define(unpack(sign))
end

vim.cmd([[
filetype plugin on
highlight Normal guibg=none
]])

vim.g.tmux_navigator_no_mappings = 1
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

local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

local cmp = require('cmp')
local lspkind = require('lspkind')

-- Include the servers you want to have installed by default below
cmp.setup({
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 60,
            ellipsis_char = '...',
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
        { name = "lazydev", group_index = 0 },
        { name = "nvim_lsp" },
        { name = "luasnip" }
    }, {
        { name = "buffer" },
    }),
})

cmp.setup({
    enabled = function()
        return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
            or require("cmp_dap").is_dap_buffer()
    end
})

cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
    sources = {
        { name = "dap" },
    },
})

cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
        { name = "conventionalcommits" },
    }, {
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
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.formatting.prettier,
        require("none-ls.diagnostics.eslint")
    },
    on_attach = MapLspCommands
})

local in_wsl = os.getenv('WSL_DISTRO_NAME') ~= nil

if in_wsl then
    vim.g.clipboard = {
        name = 'wsl clipboard',
        copy = { ["+"] = { "clip.exe" }, ["*"] = { "clip.exe" } },
        paste = { ["+"] = { "nvim_paste" }, ["*"] = { "nvim_paste" } },
        cache_enabled = true
    }
end

vim.api.nvim_create_user_command("SplitCommand", [[:'<,'>s/\s-/ \\\r    -/g]], { range = true })
vim.cmd [[
" Recognize glsl
au BufNewFile,BufRead *.frag set filetype=glsl
au BufNewFile,BufRead *.vert set filetype=glsl
]]
