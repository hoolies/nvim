local opts = {
	ensure_installed = {
		"bashls",
		"cssls",
		"efm",
		"emmet_ls",
		"html",
		"jsonls",
		"lua_ls",
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
