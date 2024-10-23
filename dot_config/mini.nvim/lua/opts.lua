vim.opt.colorcolumn = "80"

vim.opt.number = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.undofile = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.list = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0 -- Use the value of tabstop
vim.opt.expandtab = true

vim.opt.signcolumn = "yes"

vim.opt.cmdheight = 0

vim.opt.laststatus = 3
vim.opt.winbar = "%=%{%v:lua.require('util').count_diagnostics()%} %m %f"
-- vim.opt.winbar = "%=%{%v:lua.require('util').count_diagnostics()%} %m %#NeoTreeTitleBar#%f"

vim.g.mapleader = "\x20" -- Space
vim.g.maplocalleader = "\x5c" -- Backslash

vim.cmd.colorscheme("catppuccin-mocha")
