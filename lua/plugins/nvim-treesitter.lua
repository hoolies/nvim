local config = function()
	require("nvim-treesitter.configs").setup({
		indent = {
			enable = true,
      disable = {
        "python",
        "go",
      },
		},
		autotag = {
			enable = true,
		},
		ensure_installed = {
			"bash",
			"css",
			"dockerfile",
			"gitignore",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown",
			"python",
			"solidity",
			"typescript",
			"yaml",
      "elixir",
      "gleam",
      "go",
      "rust",
      "xml",
		},
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
  lazy = false,
  config = config
}
