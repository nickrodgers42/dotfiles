vim.cmd([[
]])

vim.opt.encoding = "utf-8"
vim.opt.exrc = true
vim.opt.noerrorbells = true

vim.opt.shiftwidth=4
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.nostartofline = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.nowrap = true
vim.opt.colorcolumn=80
vim.opt.signcolumn=yes
vim.opt.scrolloff=8

vim.opt.wildmenu = true
vim.opt.showcmd = true

vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.incsearch = true

vim.opt.backspace = "indent,eol,start"
vim.opt.ruler = true
vim.opt.laststatus=2
vim.opt.confirm = true
vim.opt.visualbell = true
vim.opt.t_vb = nil

vim.opt.noswapfile = true
vim.opt.nobackup = true
vim.opt.nowritebackup = true
vim.opt.undodir = "~/.vim/undodir"
vim.opt.undofile = true

vim.opt.ttimeoutlen = 100
vim.opt.updatetime = 50
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {})
vim.g.mapleader = " "

vim.opt.guicursor = nil
vim.opt.termguicolors = true
vim.opt.listchars = { space = '⋅' ,tab ='⋅⋅»' }
vim.opt.list = true

