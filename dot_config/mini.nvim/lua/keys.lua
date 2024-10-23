-- function safe_map(...) pcall(vim.keymap.set, ...) end
-- function safe_map(mode, key, action, options)
--   pcall(vim.keymap.set, mode, key, action, options)
-- end
-- safe_map('n', '<Leader>zz', MiniPick.builtin.live_grep)

-- vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {})

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set({ "n", "v" }, "gh", "^")
vim.keymap.set({ "n", "v" }, "gl", "$")

vim.keymap.set("n", "<Leader>w", "<C-w>", { remap = true })

-- vim.keymap.set('n', '<Leader>qq', '<Cmd>q<CR>')
vim.keymap.set("n", "<Leader>qr", "<Cmd>:source %<CR>")
vim.keymap.set("n", "<Leader>qa", "<Cmd>qa<CR>")
vim.keymap.set("n", "<Leader>fs", "<Cmd>write<CR>")

vim.keymap.set("n", "<Leader>fe", "<Cmd>Explore<CR>")
-- vim.keymap.set('n', '<Leader>ff', MiniFiles.open)
vim.keymap.set("n", "<Leader>ff", function()
	MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
end)

vim.keymap.set("n", "<Leader>tn", "<Cmd>tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<Leader>tc", "<Cmd>tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<Leader>tl", "gt", { desc = "Next tab" })
vim.keymap.set("n", "<Leader>th", "gT", { desc = "Previous tab" })

-- Select / Search
vim.keymap.set("n", "<Leader>sf", MiniPick.builtin.files)
vim.keymap.set("n", "<Leader>sr", MiniPick.builtin.resume)
vim.keymap.set("n", "<Leader>sg", MiniPick.builtin.grep_live)
vim.keymap.set("n", "<Leader>sw", function()
	MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>") })
end)
vim.keymap.set("n", "<Leader>sb", MiniPick.builtin.buffers)
vim.keymap.set("n", "<Leader>sB", function()
	MiniPick.builtin.buffers({ include_unlisted = true }, {
		mappings = {
			-- wipeout = {
			-- 	char = "<C-d>",
			-- 	func = function()
			-- 		vim.api.nvim_buf_delete(MiniPick.get_picker_matches().current.bufnr, {})
			-- 	end,
			-- },
		},
	})
end)
vim.keymap.set("n", "<Leader>sh", MiniPick.builtin.help)
vim.keymap.set("n", "<Leader>sv", function()
	MiniPick.registry.visit_paths({ cwd = "" })
end, { desc = "Visit paths" })
-- Pick visit_paths cwd=''

vim.keymap.set("n", "<Leader>`", "<Cmd>b#<CR>")

vim.keymap.set("n", "<Leader>fcm", function()
	vim.fn.chdir("~/.config/mini.nvim")
	MiniPick.builtin.files()
	-- MiniPick.builtin.files({ cwd = "~/.config/mini.nvim" })
end)

-- vim.keymap.set("n", "<C-/>", "<Cmd>sp term://nu<CR>")
vim.keymap.set("n", "<C-/>", require("util").open_floating_terminal)
vim.keymap.set("t", "<S-Esc>", "<C-\\><C-N>")

vim.keymap.set("n", "<Leader>bd", MiniBufremove.delete)
vim.keymap.set("n", "<Leader>bz", MiniMisc.zoom)

vim.keymap.set({ "n", "v" }, "<Leader>p", '"+p', { desc = "Paste from the system clipboard" })
vim.keymap.set({ "n", "v" }, "<Leader>P", '"+P', { desc = "Paste from the system clipboard" })
vim.keymap.set({ "n", "v" }, "<Leader>y", '"+y', { desc = "Yank to the system clipboard" })
vim.keymap.set("n", "<Leader>Y", "<Cmd>%y+<CR>", { desc = "Yank all to the system clipboard" })

vim.keymap.set("n", "<Leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set("n", "<Leader>cf", vim.lsp.buf.format, { desc = "Format" })
vim.keymap.set("n", "<Leader>cr", vim.lsp.buf.rename, { desc = "Rename" })

vim.keymap.set("n", "<Leader>fj", function()
	require("util").open_floating_terminal({ "yazi", vim.api.nvim_buf_get_name(0) })
end, { desc = "Yazi (current file)" })

-- vim.keymap.set("n", "<Leader>gg", "<Cmd>tabedit term://lazygit<CR>", { desc = "Lazygit" })
vim.keymap.set("n", "<Leader>gg", function()
	require("util").open_floating_terminal("lazygit")
end, { desc = "Lazygit" })

vim.keymap.set("n", "<Leader>gG", function()
	require("util").open_floating_terminal({ "lazygit", "--filter", vim.api.nvim_buf_get_name(0) })
end, { desc = "Lazygit (current file)" })

vim.keymap.set("n", "<Leader>.", function()
	local commands = {
		{
			text = "Format lua file",
			func = function()
				vim.cmd("silent !stylua %")
			end,
		},
		{
			text = "Source current file",
			func = function()
				vim.cmd("source %")
			end,
		},
		{
			text = "Organize imports",
			func = function()
				vim.lsp.buf.execute_command({
					command = "_typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
				})
			end,
		},
		{
			text = "Use MiniPick as `vim.ui.select`",
			func = function()
				vim.ui.select = MiniPick.ui_select
			end,
		},
		-- {
		-- 	text = "Use MiniNotify as `vim.notify`",
		-- 	func = function()
		-- 		vim.notify = MiniNotify.make_notify()
		-- 	end,
		-- },
		{
			text = "Toggle inlay hints",
			func = function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end,
		},
	}

	local options = {
		prompt = "Quick commands",
		format_item = function(item)
			return item.text
		end,
	}

	local callback = function(choice)
		if choice ~= nil then
			choice.func()
		end
	end

	-- local choice = MiniPick.start({
	-- 	source = {
	-- 		items = commands,
	-- 		name = "Quick commands",
	-- 		-- choose = function(choice)
	-- 		-- 	choice.func()
	-- 		-- end,
	-- 	},
	-- })
	-- if choice ~= nil then
	-- 	choice.func()
	-- end

	-- vim.notify(vim.inspect(choice))
	vim.ui.select(commands, options, callback)
end, { desc = "Quick commands" })

require("mini.clue").setup({
	triggers = {
		-- Leader triggers
		{ mode = "n", keys = "<Leader>" },
		{ mode = "x", keys = "<Leader>" },

		-- Built-in completion
		{ mode = "i", keys = "<C-x>" },

		-- `g` key
		{ mode = "n", keys = "g" },
		{ mode = "x", keys = "g" },

		-- Marks
		{ mode = "n", keys = "'" },
		{ mode = "n", keys = "`" },
		{ mode = "x", keys = "'" },
		{ mode = "x", keys = "`" },

		-- Registers
		{ mode = "n", keys = '"' },
		{ mode = "x", keys = '"' },
		{ mode = "i", keys = "<C-r>" },
		{ mode = "c", keys = "<C-r>" },

		-- Window commands
		{ mode = "n", keys = "<C-w>" },

		-- `z` key
		{ mode = "n", keys = "z" },
		{ mode = "x", keys = "z" },
	},

	clues = {
		{ mode = "n", keys = "<Leader>s", desc = "+Select / Search" },
		{ mode = "n", keys = "<Leader>f", desc = "+File" },
		{ mode = "n", keys = "<Leader>w", desc = "+Window" },
		{ mode = "n", keys = "<Leader>t", desc = "+Tab" },
		{ mode = "n", keys = "<Leader>b", desc = "+Buffer" },
		{ mode = "n", keys = "<Leader>c", desc = "+Code" },

		-- Enhance this by adding descriptions for <Leader> mapping groups
		require("mini.clue").gen_clues.builtin_completion(),
		require("mini.clue").gen_clues.g(),
		require("mini.clue").gen_clues.marks(),
		require("mini.clue").gen_clues.registers(),
		require("mini.clue").gen_clues.windows(),
		require("mini.clue").gen_clues.z(),
	},
})

-- LSP bindings temporarily backported from neovim 0.11

vim.keymap.set("n", "grn", function()
	vim.lsp.buf.rename()
end, { desc = "vim.lsp.buf.rename()" })

vim.keymap.set({ "n", "x" }, "gra", function()
	vim.lsp.buf.code_action()
end, { desc = "vim.lsp.buf.code_action()" })

vim.keymap.set("n", "grr", function()
	vim.lsp.buf.references()
end, { desc = "vim.lsp.buf.references()" })

vim.keymap.set("i", "<C-S>", function()
	vim.lsp.buf.signature_help()
end, { desc = "vim.lsp.buf.signature_help()" })
