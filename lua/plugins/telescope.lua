local config = function()
  local telescope = require('telescope')
  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-h>"] = "which_key",
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
        },
      },
    },
    pickers = {







    },
    extensions = {





    }
  })
  end

return {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.6',
    lazy = true,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = config,
    keys = {

      vim.keymap.set('n', '<leader>ff', ":lua require 'telescope.builtin'.find_files{}<CR>", { desc = "Find Files in the same directory" }),
      vim.keymap.set('n', '<leader>fg', ":lua require 'telescope.builtin'.live_grep{}<CR>", { desc = "Find word in files" }),
      vim.keymap.set('n', '<leader>fb', ":lua require 'telescope.builtin'.buffers{show_all_buffers = true}<CR>", { desc = "Find Buffers" }),
      vim.keymap.set('n', '<leader>fh', ":lua require 'telescope.builtin'.help_tags{}<CR>", { desc = "Help Tags" }),
      vim.keymap.set('n', '<leader>fo', ":lua require 'telescope.builtin'.oldfiles{}<CR>", { desc = "Old Files" }),
      vim.keymap.set('n', '<leader>fc', ":lua require 'telescope.builtin'.commands{}<CR>", { desc = "Shows Telescope Commands" }),
      vim.keymap.set('n', '<leader>ft', ":lua require 'telescope.builtin'.treesitter{}<CR>", { desc = "Find Functions & Variables" }),
    },
}
