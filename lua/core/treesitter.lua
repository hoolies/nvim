return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate", -- Command to run after installation
	event = { "BufReadPost", "BufNewFile" }, -- Load on file read/new file
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			-- List of parsers to install
			ensure_installed = {
				"bash",
				"elixir",
				"go",
				"html",
				"json",
				"lua",
				"python",
				"query",
				"vim",
				"vimdoc",
				"yaml",
			},

			-- Install parsers synchronously (for first time setup)
			sync_install = false,

			-- Automatically install missing parsers when a file is opened
			auto_install = true,

			-- Highlight configuration
			highlight = {
				enable = true, -- Enable syntax highlighting
				-- Disable Treesitter for large files to improve performance
				disable = function(lang, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
			},

			-- Indent configuration
			indent = { enable = true },

			-- Textobjects configuration (e.g., `vaC` to select around a class)
			textobjects = {
				select = {
					enable = true,
					-- Automatically jump to the start of a text object
					lookahead = true,
					keymaps = {
						-- You can define custom text objects here if needed
						-- e.g., `ac` for around class, `ic` for in class
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["a("] = "@parameter.outer",
						["i("] = "@parameter.inner",
						["a["] = "@block.outer",
						["i["] = "@block.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[]"] = "@class.outer",
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>a"] = "@parameter.inner",
					},
					swap_previous = {
						["<leader>A"] = "@parameter.inner",
					},
				},
			},
		})
	end,
}
-- vim: ts=2 sts=2 sw=2 et
