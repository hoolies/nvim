local opts = {
	ensure_installed = {
		"bashls",
		"cssls",
		"efm",
    "elixirls",
		"emmet_ls",
		"html",
		"jsonls",
		"lua_ls",
    "nextls",
		"pyright",
		"solidity",
		"tailwindcss",
		"tsserver",
	},

	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
