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
      -- Default configuration for builtin pickers goes here:
      -- picker_name = {
      --   picker_config_key = value,
      --   ...
      -- }
      -- Now the picker_config_key will be applied every time you call this
      -- builtin picker
    },
    extensions = {
      -- Your extension configuration goes here:
      -- extension_name = {
      --   extension_config_key = value,
      -- }
      -- please take a look at the readme of the extension you want to configure
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
      -- Telescope binding
      vim.keymap.set('n', '<leader>ff', ":lua require 'telescope.builtin'.find_files{}<CR>"),                        -- find files
      vim.keymap.set('n', '<leader>fg', ":lua require 'telescope.builtin'.live_grep{}<CR>"),                         -- find word in files
      vim.keymap.set('n', '<leader>fb', ":lua require 'telescope.builtin'.buffers{show_all_buffers = true}<CR>"),    -- find buffers
      vim.keymap.set('n', '<leader>fh', ":lua require 'telescope.builtin'.help_tags{}<CR>"),                         -- find help tags
      vim.keymap.set('n', '<leader>fo', ":lua require 'telescope.builtin'.oldfiles{}<CR>"),                          -- find old files
      vim.keymap.set('n', '<leader>fc', ":lua require 'telescope.builtin'.commands{}<CR>"),                          -- find commands
      vim.keymap.set('n', '<leader>ft', ":lua require 'telescope.builtin'.treesitter{}<CR>"),                        -- find functions, variables
    },
}
