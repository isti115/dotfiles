require("mini.deps").setup({
	path = {
		snapshot = table.concat({
			vim.fn.stdpath("config"),
			string.format("mini-deps-snap-%s", os.date("!%Y%m%dT%H%M%SZ")),
		}, "/"),
	},
})

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
	require("mini.notify").setup()
	vim.notify = MiniNotify.make_notify()
end)

now(function()
	require("mini.icons").setup()
end)
now(function()
	require("mini.indentscope").setup()
end)
now(function()
	require("mini.completion").setup()
end)
now(function()
	require("mini.statusline").setup()
end)

now(function()
	require("mini.starter").setup()
end)
now(function()
	require("mini.sessions").setup()
end)
now(function()
	require("mini.visits").setup()
end)
now(function()
	require("mini.extra").setup()
end)
now(function()
	require("mini.clue").setup()
end)

now(function()
	require("mini.files").setup({ options = { use_as_default_explorer = false } })
end)
now(function()
	require("mini.comment").setup()
end)
now(function()
	require("mini.git").setup()
end)
now(function()
	require("mini.diff").setup()
end)
now(function()
	require("mini.pick").setup({ options = { content_from_bottom = true } })
end)

now(function()
	require("mini.align").setup()
end)
now(function()
	require("mini.trailspace").setup()
end)

now(function()
	require("mini.visits").setup()
end)
now(function()
	require("mini.bufremove").setup()
end)

now(function()
	require("mini.hipatterns").setup({
		highlighters = {
			-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
			fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
			hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
			todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
			note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

			-- Highlight hex color strings (`#rrggbb`) using that color
			hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
		},
	})
end)

now(function()
	require("mini.misc").setup()
	MiniMisc.setup_auto_root()
end)

later(function()
	require("mini.ai").setup()
end)
later(function()
	require("mini.surround").setup()
end)

later(function()
	require("mini.jump2d").setup()
end)

later(function()
	require("mini.snippets").setup({
		snippets = {
			-- MiniSnippets.gen_loader.from_lang(),
			require("mini.snippets").gen_loader.from_lang(),
		},
	})
end)

-- --- OTHER ---

now(function()
	add({ source = "catppuccin/nvim" })
end)

now(function()
	add({ source = "neovim/nvim-lspconfig" })

	require("lspconfig").efm.setup({
		-- TODO: Populate `filetypes` as per `efm` docs. (`:checkhealth lspconfig`)
	})

	local inlayHints = {
		includeInlayEnumMemberValueHints = true,
		includeInlayFunctionLikeReturnTypeHints = true,
		includeInlayFunctionParameterTypeHints = true,
		includeInlayParameterNameHints = "literals",
		-- includeInlayParameterNameHintsWhenArgumentMatchesName = true,
		includeInlayPropertyDeclarationTypeHints = true,
		-- includeInlayVariableTypeHints = true,
		-- includeInlayVariableTypeHintsWhenTypeMatchesName = true,
	}

	require("lspconfig").ts_ls.setup({
		settings = {
			javascript = {
				inlayHints = inlayHints,
			},
			typescript = {
				inlayHints = inlayHints,
			},
		},
		on_attach = function(client, _bufnr)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
		end,
	})

	require("lspconfig").fsautocomplete.setup({})

	vim.lsp.commands["_typescript.organizeImports"] = function(command_params)
		local bufname = vim.api.nvim_buf_get_name(0)
		vim.lsp.buf.execute_command({
			command = "_typescript.organizeImports",
			arguments = { bufname },
		})
	end

	local function custom_code_action_handler(_, result, ctx)
		if not result then
			return
		end

		-- Add "Organize Imports" manually to the result
		table.insert(result, {
			title = "Organize Imports",
			command = "_typescript.organizeImports",
			arguments = { vim.api.nvim_buf_get_name(0) },
		})

		-- Show the code actions menu
		vim.lsp.util.apply_text_document_edit(result, ctx)
	end

	vim.lsp.handlers["textDocument/codeAction"] = custom_code_action_handler
end)

later(function()
	add({
		source = "nvim-treesitter/nvim-treesitter",
		-- Use 'master' while monitoring updates in 'main'
		checkout = "master",
		monitor = "main",
		-- Perform action after every checkout
		hooks = {
			post_checkout = function()
				vim.cmd("TSUpdate")
			end,
		},
	})
	-- Possible to immediately execute code which depends on the added plugin
	require("nvim-treesitter.configs").setup({
		-- ensure_installed = { "lua", "vimdoc" },
		highlight = { enable = true },
		incremental_selection = { enable = true },
	})
end)

now(function()
	add({ source = "Vigemus/iron.nvim" })
	iron = require("iron.core")

	iron.setup({
		config = {
			-- Whether a repl should be discarded or not
			scratch_repl = true,
			-- Your repl definitions come here
			repl_definition = {
				fsharp = {
					command = { "dotnet", "fsi" },
					-- close = ";;",
					format = function(lines)
						table.insert(lines, ";;\13")
						return lines
					end,
				},
			},
			-- How the repl window will be displayed
			-- See below for more information
			-- repl_open_cmd = require("iron.view").bottom(40),
			repl_open_cmd = require("iron.view").split.vertical(80),
		},
		-- Iron doesn't set keymaps by default anymore.
		-- You can set them here or manually add keymaps to the functions in iron.core
		keymaps = {
			send_motion = "<LocalLeader>sc",
			visual_send = "<LocalLeader>sc",
			send_file = "<LocalLeader>sf",
			send_line = "<LocalLeader>sl",
			send_mark = "<LocalLeader>sm",
			mark_motion = "<LocalLeader>mc",
			mark_visual = "<LocalLeader>mc",
			remove_mark = "<LocalLeader>md",
			cr = "<LocalLeader>s<cr>",
			interrupt = "<LocalLeader>s<LocalLeader>",
			exit = "<LocalLeader>sq",
			clear = "<LocalLeader>cl",
		},
		-- If the highlight is on, you can change how it looks
		-- For the available options, check nvim_set_hl
		highlight = {
			italic = true,
		},
		ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
	})

	-- iron also has a list of commands, see :h iron-commands for all available commands
	vim.keymap.set("n", "<LocalLeader>rs", "<cmd>IronRepl<cr>")
	vim.keymap.set("n", "<LocalLeader>rr", "<cmd>IronRestart<cr>")
	vim.keymap.set("n", "<LocalLeader>rf", "<cmd>IronFocus<cr>")
	vim.keymap.set("n", "<LocalLeader>rh", "<cmd>IronHide<cr>")
end)
