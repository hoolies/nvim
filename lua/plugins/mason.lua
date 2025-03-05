return {
	"williamboman/mason-lspconfig.nvim",
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"ansiblels",
				"bashls",
				"clangd",
				"cssls",
				"dockerls",
				"efm",
				"elixirls",
				"emmet_ls",
				"gopls",
				"grammarly",
				"html",
				"jinja_lsp",
				"jsonls",
				"kotlin_language_server",
				"lemminx",
				"lua_ls",
				"nginx_language_server",
				"ruff",
				"rust_analyzer",
				"solidity",
				"sqlls",
				"tailwindcss",
				"terraformls",
				"pyright",
			},
		})
	end,
	dependencies = {
		"williamboman/mason.nvim",
		cmd = "Mason",
		event = "BufReadPre",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	automatic_installation = true,
}
