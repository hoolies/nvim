local opts = {
	ensure_installed = {
		"bashls",
    "black",
		"cssls",
		"efm",
    "elixirls",
		"emmet_ls",
    "flake8",
		"html",
		"jsonls",
		"lua_ls",
		"pyright",
		"solidity",
		"tailwindcss",
		"ts_ls",
	},

	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
