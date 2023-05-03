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
for k, v in pairs(vim_opts) do
    vim.opt[k] = v
end
-- Tables can't store nil values
vim.opt.guicursor = nil
vim.opt.mouse = nil

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
    'zbirenbaum/copilot.lua',
    'zbirenbaum/copilot-cmp',
    'rafamadriz/friendly-snippets',
    'lewis6991/gitsigns.nvim',
    'nmac427/guess-indent.nvim',
    'lukas-reineke/indent-blankline.nvim',
    'onsails/lspkind.nvim',
    'nvim-lualine/lualine.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'mfussenegger/nvim-jdtls',
    'rcarriga/nvim-notify',
    'tpope/vim-fugitive',
    'psliwka/vim-smoothie',
    'vim-test/vim-test',
    'christoomey/vim-tmux-navigator',
    'preservim/vimux',
    'vimwiki/vimwiki',
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
    'copilot_cmp',
    'dapui',
    'gitsigns',
    'guess-indent',
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


local parsers = {
    "bash",
    "java",
    "javascript",
    "kotlin",
    "lua",
    "python",
    "smithy",
    "typescript",
    "vimdoc",
}
require('nvim-treesitter.configs').setup({
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

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.formatting.prettier
    }
})

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
vim.g.vimwiki_listsyms = ' ○◐●✓'
vim.g["test#strategy"] = 'vimux'
vim.g.VimuxOrientation = "h"

local map = vim.api.nvim_set_keymap
local nmap = function(mapping, command, opts)
    opts = opts or { noremap = true, silent = true }
    map('n', mapping, ':' .. command .. '<CR>', opts)
end

vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {})
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {})
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

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

require('telescope').load_extension('fzf')
require('telescope').load_extension('aerial')

require("notify").setup({
    background_colour = "#000000",
})
vim.notify = require('notify')

require("indent_blankline").setup {
    show_current_context = true,
    use_treesitter = true,
    bufname_exclude = { '' }
}

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


local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

require("copilot").setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
})

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
            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select=true })
          else
            fallback()
          end
        end)
    },
    sources = cmp.config.sources({
        { name = "copilot" },
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

vim.cmd([[au BufRead,BufNewFile *.smithy		setfiletype smithy]])

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
        dashboard.button("s", "󰦛" .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
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
