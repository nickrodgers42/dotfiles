-- VSCode Neovim Configuration
-- Adapted from regular init.lua for VSCode compatibility

-- Set vim options that work in VSCode
local vim_opts = {
    autoindent = true,
    backspace = "indent,eol,start",
    expandtab = true,
    ignorecase = true,
    incsearch = true,
    number = true,
    relativenumber = true,
    scrolloff = 8,
    shiftwidth = 4,
    smartcase = true,
    smartindent = true,
    softtabstop = 4,
    splitright = true,
    tabstop = 4,
    wrap = false,
}

local function set_opts(opts)
    for k, v in pairs(opts) do
        vim.opt[k] = v
    end
end

set_opts(vim_opts)

-- Set leader key
vim.g.mapleader = " "

-- VSCode API functions
local vscode = require('vscode-neovim')

-- Helper function for VSCode commands
local function vscode_call(command, args)
    vscode.call(command, args)
end

-- Basic keybindings that work well in VSCode
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {})
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {})
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true, silent = true })

-- VSCode keybinding tables (similar to your init.lua pattern)
local vscode_maps = {
    -- File operations
    { '<C-p>',       'workbench.action.quickOpen' },
    { '<leader>ff',  'workbench.action.quickOpen' },
    { '<leader>fg',  'workbench.action.findInFiles' },
    { '<leader>fb',  'workbench.action.showAllEditors' },
    { '<leader>fh',  'workbench.action.openGlobalKeybindings' },
    { '<leader>fv',  'workbench.action.openSettingsJson' },
    { '<leader>fj',  'editor.action.formatDocument' },

    -- Explorer/File tree (matching nvim-tree)
    { '<C-n>',       'workbench.view.explorer' },
    { '<leader>n',   'workbench.files.action.showActiveFileInExplorer' },

    -- Split navigation (VSCode groups - matching tmux navigator)
    { '<C-h>',       'workbench.action.focusLeftGroup' },
    { '<C-j>',       'workbench.action.focusBelowGroup' },
    { '<C-k>',       'workbench.action.focusAboveGroup' },
    { '<C-l>',       'workbench.action.focusRightGroup' },

    -- LSP-like functionality (matching your LSP mappings)
    { 'gd',          'editor.action.revealDefinition' },
    { 'gD',          'editor.action.revealDeclaration' },
    { 'gi',          'editor.action.goToImplementation' },
    { 'gr',          'editor.action.goToReferences' },
    { 'K',           'editor.action.showHover' },
    { '<leader>rn',  'editor.action.rename' },
    { '<leader>ca',  'editor.action.quickFix' },
    { '<leader>f',   'editor.action.formatDocument' },
    { '<leader>D',   'editor.action.revealDefinition' },
    { '<leader>wa',  'workbench.action.addRootFolder' },
    { '<leader>wr',  'workbench.action.removeRootFolder' },

    -- Diagnostics (matching your diagnostic mappings)
    { '<leader>e',   'editor.action.marker.next' },
    { '[d',          'editor.action.marker.prevInFiles' },
    { ']d',          'editor.action.marker.nextInFiles' },
    { '<leader>q',   'workbench.actions.view.problems' },

    -- Symbol navigation (matching aerial)
    { '<leader>a',   'workbench.action.gotoSymbol' },
    { '<leader>fa',  'workbench.action.showAllSymbols' },
    { '<leader>fw',  'workbench.action.showAllSymbols' },

    -- Comments (matching Comment.nvim)
    { 'gcc',         'editor.action.commentLine' },

    -- Code folding
    { 'za',          'editor.toggleFold' },
    { 'zR',          'editor.unfoldAll' },
    { 'zM',          'editor.foldAll' },

    -- Multi-cursor and selection (VSCode specific)
    { '<C-d>',       'editor.action.addSelectionToNextFindMatch' },
    { '<C-u>',       'cursorUndo' },

    -- Bracket matching
    { '%',           'editor.action.jumpToBracket' },
}

-- Debugging mappings (matching your DAP setup)
local debug_maps = {
    { '<leader>b',   'editor.debug.action.toggleBreakpoint' },
    { '<leader>B',   'editor.debug.action.conditionalBreakpoint' },
    { '<leader>lp',  'editor.debug.action.conditionalBreakpoint' },
    { '<leader>dd',  'workbench.action.debug.start' },
    { '<leader>dc',  'workbench.action.debug.continue' },
    { '<leader>di',  'workbench.action.debug.stepInto' },
    { '<leader>dn',  'workbench.action.debug.stepOver' },
    { '<leader>dp',  'workbench.action.debug.stepOut' },
    { '<leader>dq',  'workbench.action.debug.stop' },
    { '<leader>dr',  'workbench.debug.action.toggleRepl' },
    { '<leader>dl',  'workbench.action.debug.restart' },
    { '<leader>do',  'workbench.debug.action.toggleRepl' },
}

-- Git operations (matching gitsigns)
local git_maps = {
    { '<leader>hs',  'git.stageSelectedRanges' },
    { '<leader>hr',  'git.revertSelectedRanges' },
    { '<leader>hS',  'git.stageAll' },
    { '<leader>hR',  'git.revertAll' },
    { '<leader>hp',  'editor.action.dirtydiff.next' },
    { '<leader>hb',  'gitlens.toggleLineBlame' },
    { '<leader>hd',  'git.openChange' },
    { '<leader>tb',  'gitlens.toggleLineBlame' },
    { ']c',          'workbench.action.editor.nextChange' },
    { '[c',          'workbench.action.editor.previousChange' },
}

-- Testing mappings (matching neotest)
local test_maps = {
    { '<leader>tt',  'test-explorer.run' },
    { '<leader>tT',  'test-explorer.run-file' },
    { '<leader>ts',  'test-explorer.run-all' },
    { '<leader>tl',  'test-explorer.rerun' },
    { '<leader>tq',  'test-explorer.cancel' },
    { '<leader>to',  'test-explorer.show-output' },
    { '<leader>tc',  'test-explorer.clear-output' },
}

-- Terminal and workspace management
local workspace_maps = {
    { '<leader>tt',  'workbench.action.terminal.toggleTerminal' },
    { '<leader>tn',  'workbench.action.terminal.new' },
}

-- Split management
local split_maps = {
    { '<leader>sv',  'workbench.action.splitEditor' },
    { '<leader>sh',  'workbench.action.splitEditorDown' },
    { '<leader>sc',  'workbench.action.closeActiveEditor' },
}

-- Search and replace
local search_maps = {
    { '<leader>sr',  'editor.action.startFindReplaceAction' },
    { '<leader>sw',  'workbench.action.findInFiles' },
}

-- Sidebar and panel toggles
local ui_maps = {
    { '<leader>sb',  'workbench.action.toggleSidebarVisibility' },
    { '<leader>sp',  'workbench.view.explorer' },
    { '<leader>sg',  'workbench.view.scm' },
    { '<leader>sx',  'workbench.view.extensions' },
    { '<leader>pt',  'workbench.action.togglePanel' },
    { '<leader>po',  'workbench.action.output.toggleOutput' },
    { '<leader>z',   'workbench.action.toggleZenMode' },
}

-- Buffer/Tab management
local buffer_maps = {
    { '<leader>bd',  'workbench.action.closeActiveEditor' },
    { '<leader>bn',  'workbench.action.nextEditor' },
    { '<leader>bp',  'workbench.action.previousEditor' },
}

-- Settings and configuration
local config_maps = {
    { '<leader>cs',  'workbench.action.openSettings' },
    { '<leader>ck',  'workbench.action.openGlobalKeybindings' },
    { '<leader>cw',  'workbench.action.openWorkspaceSettings' },
    { '<leader>:',   'workbench.action.showCommands' },
}

-- Additional utility mappings
local utility_maps = {
    { '<leader>h',   'editor.action.inlayHints.toggle' },
    { '<leader>pd',  'editor.action.peekDefinition' },
    { '<leader>pr',  'editor.action.referenceSearch.trigger' },
    { '<leader>bc',  'breadcrumbs.focusAndSelect' },
    { '<leader>nc',  'notifications.clearAll' },
    { '<leader>ex',  'workbench.view.extensions' },
    { '<leader>gl',  'workbench.action.gotoLine' },
    { '<leader>tw',  'editor.action.toggleWordWrap' },
    { '<leader>tm',  'editor.action.toggleMinimap' },
    { '<leader>mp',  'markdown.showPreview' },
}

-- Function to apply keymaps from tables
local function apply_keymaps(keymaps, mode)
    mode = mode or 'n'
    for _, keymap in ipairs(keymaps) do
        local key = keymap[1]
        local command = keymap[2]
        vim.keymap.set(mode, key, function() vscode_call(command) end, { noremap = true, silent = true })
    end
end

-- Visual mode specific mappings
local visual_maps = {
    { 'gc',          'editor.action.commentLine' },
    { '<leader>f',   'editor.action.formatSelection' },
}

-- Function to setup VSCode-specific autocommands
local function setup_autocommands()
    local vscode_group = vim.api.nvim_create_augroup('VSCodeNeovim', { clear = true })
    
    -- You can add VSCode-specific autocommands here if needed
    vim.api.nvim_create_autocmd('InsertLeave', {
        group = vscode_group,
        callback = function()
            -- VSCode handles auto-save, but you can trigger it explicitly if needed
            -- vscode_call('workbench.action.files.save')
        end,
    })
end

-- Initialize the configuration
function vscodeModule.setup()
    vim.print("Setting up VSCode Neovim configuration...")
    
    -- Apply all keymaps
    apply_keymaps(vscode_maps)
    apply_keymaps(debug_maps)
    apply_keymaps(git_maps)
    apply_keymaps(test_maps)
    apply_keymaps(workspace_maps)
    apply_keymaps(split_maps)
    apply_keymaps(search_maps)
    apply_keymaps(ui_maps)
    apply_keymaps(buffer_maps)
    apply_keymaps(config_maps)
    apply_keymaps(utility_maps)
    
    -- Apply visual mode mappings
    apply_keymaps(visual_maps, 'v')
    
    -- Setup autocommands
    setup_autocommands()
    
    -- Additional VSCode-specific settings
    vim.opt.clipboard = "unnamedplus"  -- Use system clipboard
    vim.opt.mouse = ""  -- Let VSCode handle mouse
    
    vim.print("VSCode Neovim configuration loaded successfully!")
end

-- Auto-setup when module is loaded
vscodeModule.setup()

-- Function to reload VSCode window (useful for testing)
function vscodeModule.reload()
    vscode_call('workbench.action.reloadWindow')
end

-- Function to open VSCode settings
function vscodeModule.open_settings()
    vscode_call('workbench.action.openSettings')
end

-- Function to toggle between editor and terminal
function vscodeModule.toggle_terminal()
    vscode_call('workbench.action.terminal.toggleTerminal')
end

-- Function to add custom keymaps (for easy extension)
function vscodeModule.add_keymaps(keymaps, mode)
    apply_keymaps(keymaps, mode)
end