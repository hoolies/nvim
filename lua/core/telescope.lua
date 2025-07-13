return {
	{ -- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- If encountering errors, see telescope-fzf-native README for installation instructions
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			-- Telescope is a fuzzy finder that comes with a lot of different things that
			-- it can fuzzy find! It's more than just a "file finder", it can search
			-- many different aspects of Neovim, your workspace, LSP, and more!
			--
			-- The easiest way to use Telescope, is to start by doing something like:
			--  :Telescope help_tags
			--
			-- After running this command, a window will open up and you're able to
			-- type in the prompt window. You'll see a list of `help_tags` options and
			-- a corresponding preview of the help.
			--
			-- Two important keymaps to use while in Telescope are:
			--  - Insert mode: <c-/>
			--  - Normal mode: ?
			--
			-- This opens a window that shows you all of the keymaps for the current
			-- Telescope picker. This is really useful to discover what Telescope can
			-- do as well as how to actually do it!

			local actions = require("telescope.actions")
			-- [[ Configure Telescope ]]
			-- See `:help telescope` and `:help telescope.setup()`
			require("telescope").setup({
				-- You can put your default mappings / updates / etc. in here
				--  All the info you're looking for is in `:help telescope.setup()`
				-- defaults = {
				-- Mapping to do CTRL + J or K to move up and down instead of UP/Down, CTRL + N/P
				-- 	mappings = {
				-- 		i = {
				-- 			["<c-j>"] = {
				-- 				actions.move_selection_next,
				-- 				type = "action",
				-- 				opts = {
				-- 					nowait = true,
				-- 					silent = true,
				-- 				},
				-- 			},
				-- 			["<c-k>"] = {
				-- 				actions.move_selection_previous,
				-- 				type = "action",
				-- 				opts = {
				-- 					nowait = true,
				-- 					silent = true,
				-- 				},
				-- 			},
				-- 		},
				-- 	},
				-- },
				-- pickers = {}
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- Enable Telescope extensions if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			-- See `:help telescope.builtin`
			local builtin = require("telescope.builtin")
			vim.keymap.set(
				"n",
				"<leader>fb",
				":lua require 'telescope.builtin'.buffers{show_all_buffers = true}<CR>",
				{ desc = "Find Buffers" }
			)
			vim.keymap.set(
				"n",
				"<leader>fc",
				":lua require 'telescope.builtin'.commands{}<CR>",
				{ desc = "Shows Telescope Commands" }
			)
			vim.keymap.set(
				"n",
				"<leader>ff",
				":lua require 'telescope.builtin'.find_files{}<CR>",
				{ desc = "Find Files in the same directory" }
			)
			vim.keymap.set(
				"n",
				"<leader>flf",
				":lua require 'telescope.builtin'.live_grep{}<CR>",
				{ desc = "Find word in files" }
			)
			vim.keymap.set(
				"n",
				"<leader>flg",
				":lua require 'telescope.builtin'.git_files{}<CR>",
				{ desc = "Fuzzy find git files" }
			)
			vim.keymap.set(
				"n",
				"<leader>fh",
				":lua require 'telescope.builtin'.help_tags{}<CR>",
				{ desc = "Help Tags" }
			)
			vim.keymap.set(
				"n",
				"<leader>fk",
				":lua require 'telescope.builtin'.keymaps{}<CR>",
				{ desc = "Show Keymaps" }
			)
			vim.keymap.set("n", "<leader>fo", ":lua require 'telescope.builtin'.oldfiles{}<CR>", { desc = "Old Files" })
			vim.keymap.set(
				"n",
				"<leader>fr",
				":lua require 'telescope.builtin'.registers{}<CR>",
				{ desc = "Show registers" }
			)
			vim.keymap.set(
				"n",
				"<leader>fs",
				":lua require 'telescope.builtin'.grep_string{}<CR>",
				{ desc = "Search sting under cursor or selection" }
			)
			vim.keymap.set(
				"n",
				"<leader>ft",
				":lua require 'telescope.builtin'.treesitter{}<CR>",
				{ desc = "Find Functions & Variables" }
			)
			vim.keymap.set(
				"n",
				"<leader>fzh",
				":lua require 'telescope.builtin'.command_history{}<CR>",
				{ desc = "Show command history" }
			)
			vim.keymap.set(
				"n",
				"<leader>fzq",
				":lua require 'telescope.builtin'.quickfixhistory{}<CR>",
				{ desc = "List all quickfix lists" }
			)
			vim.keymap.set(
				"n",
				"<leader>fzs",
				":lua require 'telescope.builtin'.search_history{}<CR>",
				{ desc = "Show search history" }
			)
			vim.keymap.set(
				"n",
				"<leader>fm",
				":lua require 'telescope.builtin'.marks{}<CR>",
				{ desc = "List marks and their value" }
			)
			vim.keymap.set(
				"n",
				"<leader>fj",
				":lua require 'telescope.builtin'.jumplist{}<CR>",
				{ desc = "List jumplist" }
			)

			-- Slightly advanced example of overriding default behavior and theme
			vim.keymap.set("n", "<leader>/", function()
				-- You can pass additional configuration to Telescope to change the theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			-- It's also possible to pass additional configuration options.
			--  See `:help telescope.builtin.live_grep()` for information about particular keys
			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })

			-- Shortcut for searching your Neovim configuration files
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
