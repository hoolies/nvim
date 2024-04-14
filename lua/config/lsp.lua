local vim_modes = {
	n = "n",
	i = "i",
	v = "v",
}

local default_opts = {
	noremap = true,
	silent = true,
}

--- @param opts (table|nil)
--- @return table
local get_opts = function(opts)
	local all_opts = opts
	if all_opts == nil then
		all_opts = {}
	end
	for k, v in pairs(default_opts) do
		all_opts[k] = all_opts[k] or v
	end
	return all_opts
end

--- @param vimmode (string|nil)
--- @return string
local get_mode = function(vimmode)
	local modeString = vim_modes[vimmode]
	if modeString == nil then
		return "n"
	else
		return modeString
	end
end

--- @param command (string)
--- @return string
local get_cmd_string = function(command)
	return [[<cmd>]] .. command .. [[<CR>]]
end

--- @param keymaps string String
--- @param command string String
--- @param vimmode (string|nil)
--- @param options (table|nil)
--- @return nil
local mapkey = function(keymaps, command, vimmode, options)
	local mode = get_mode(vimmode)
	local lhs = keymaps
	local rhs = get_cmd_string(command)
	local opts = get_opts(options)
	vim.keymap.set(mode, lhs, rhs, opts)
end


local M = {}

-- set keymaps on the active lsp server
M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	mapkey("<leader>fd", "Lspsaga finder", "n", opts) -- go to definition
	mapkey("<leader>gd", "Lspsaga peek_definition", "n", opts) -- peak definition
	mapkey("<leader>gD", "Lspsaga goto_definition", "n", opts) -- go to definition
	mapkey("<leader>ca", "Lspsaga code_action", "n", opts) -- see available code actions
	mapkey("<leader>rn", "Lspsaga rename", "n", opts) -- smart rename
	mapkey("<leader>D", "Lspsaga show_line_diagnostics", "n", opts) -- show  diagnostics for line
	mapkey("<leader>d", "Lspsaga show_cursor_diagnostics", "n", opts) -- show diagnostics for cursor
	mapkey("<leader>pd", "Lspsaga diagnostic_jump_prev", "n", opts) -- jump to prev diagnostic in buffer
	mapkey("<leader>nd", "Lspsaga diagnostic_jump_next", "n", opts) -- jump to next diagnostic in buffer
	mapkey("K", "Lspsaga hover_doc", "n", opts) -- show documentation for what is under cursor

	if client.name == "pyright" then
		mapkey("<Leader>oi", "PyrightOrganizeImports", "n", opts)
	end
end

M.diagnostic_signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = "" }

return M
