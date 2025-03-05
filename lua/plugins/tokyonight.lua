return {
	{ -- You can easily change to a different colorscheme.
		-- Change the name of the colorscheme plugin below, and then
		-- change the command in the config to whatever the name of that colorscheme is.
		--
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
		"folke/tokyonight.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		lazy = false,
		transparent = true,
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("tokyonight").setup({
				styles = {
					comments = { italic = false }, -- Disable italics in comments
					sidebars = "transparent",
					floats = "transparent",
				},
			})

			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			vim.cmd.colorscheme("tokyonight-storm")
			-- Custom Colours
			vim.cmd([[highlight LineNr guifg=#29465B]])
			vim.cmd([[highlight CursorColumn guifg=#737CA1]])
			vim.cmd([[highlight CursorLineNr guifg=#FF00FF]])
			vim.cmd([[highlight IncSearch guibg=#FF00FF]])
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
