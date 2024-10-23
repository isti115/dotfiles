local util = {}

function util.open_floating_terminal(cmd)
	local buf = vim.api.nvim_create_buf(false, true)
	local width = math.floor(vim.o.columns * 0.9)
	local height = math.floor(vim.o.lines * 0.9)

	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	local opts = {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	}

	vim.api.nvim_open_win(buf, true, opts)
	vim.fn.termopen(cmd or vim.o.shell)
	vim.cmd("startinsert")
end

function util.count_diagnostics()
	local levels = {
		{
			severity = vim.diagnostic.severity.ERROR,
			color = "DiagnosticError",
			icon = "󰀩",
		},
		{
			severity = vim.diagnostic.severity.WARN,
			color = "DiagnosticWarn",
			icon = "󰀦",
		},
		{
			severity = vim.diagnostic.severity.INFO,
			color = "DiagnosticInfo",
			icon = "󰀨",
		},
		{
			severity = vim.diagnostic.severity.HINT,
			color = "DiagnosticHint",
			icon = "󰀧",
		},
	}

	local output = ""

	for _, level in pairs(levels) do
		local count = #vim.diagnostic.get(0, { severity = level.severity })
		if count > 0 then
			output = output .. string.format("%%#%s# %s %d ", level.color, level.icon, count)
		end
	end

	return output .. "%*"
end

return util
