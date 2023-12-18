-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

-- Remove some built-in keymaps.
pcall(vim.keymap.del, "t", "<Esc><Esc>")
pcall(vim.keymap.del, "t", "<C-h>")
pcall(vim.keymap.del, "t", "<C-j>")
pcall(vim.keymap.del, "t", "<C-k>")
pcall(vim.keymap.del, "t", "<C-l>")

-- Clipboard
vim.keymap.set({ "n", "v" }, "<Leader>p", '"+p', { desc = "Paste from the system clipboard" })
vim.keymap.set({ "n", "v" }, "<Leader>P", '"+P', { desc = "Paste from the system clipboard" })
vim.keymap.set({ "n", "v" }, "<Leader>y", '"+y', { desc = "Yank to the system clipboard" })
vim.keymap.set("n", "<Leader>Y", '<Cmd>%y+<CR>', { desc = "Yank all to the system clipboard" })

-- Lazy
vim.keymap.set("n", "<Leader>ll", "<Cmd>Lazy<CR>", { desc = "Lazy" })
vim.keymap.set("n", "<Leader>lc", Util.telescope.config_files(), { desc = "LazyVim Config" })
vim.keymap.set("n", "<leader>lC", Util.news.changelog, { desc = "LazyVim Changelog" })

-- Miscellaneous
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set({ "n", "v" }, "gh", '^')
vim.keymap.set({ "n", "v" }, "gl", '$')
vim.keymap.set("n", "<Leader>w", "<C-w>")
vim.keymap.set("n", "<Leader>fs", "<Cmd>write<CR>")

-- Quit
vim.keymap.set("n", "<Leader>qq", "<Cmd>quit<CR>", { desc = "Quit current buffer" })
vim.keymap.set("n", "<Leader>qQ", "<Cmd>quit!<CR>", { desc = "Force quit current buffer" })
vim.keymap.set("n", "<Leader>qa", "<Cmd>quitall<CR>", { desc = "Quit all buffers" })

-- Tabs
vim.keymap.set("n", "<Leader>tn", "<Cmd>tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<Leader>tc", "<Cmd>tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<Leader>tl", "gt", { desc = "Next tab" })
vim.keymap.set("n", "<Leader>th", "gT", { desc = "Previous tab" })
