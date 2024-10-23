vim.api.nvim_create_autocmd("BufWritePre", {
	group = "MiniTrailspace",
	callback = function()
		MiniTrailspace.trim()
		MiniTrailspace.trim_last_lines()
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	-- TODO: group
	callback = function()
		vim.lsp.buf.format()
	end,
})

vim.api.nvim_create_autocmd("DiagnosticChanged", {
	-- TODO: group
	callback = function()
		vim.cmd.redrawstatus({ bang = true })
	end,
})

vim.api.nvim_create_autocmd("TermClose", {
	-- TODO: group
	pattern = { "term://*lazygit" },
	callback = function()
		vim.api.nvim_input("<CR>")
	end,
})
