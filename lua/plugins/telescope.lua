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
    pickers = {},
    extensions = {},
  })
  end

return {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.6',
    lazy = true,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = config,
    keys = {
      vim.keymap.set('n', '<leader>fb', ":lua require 'telescope.builtin'.buffers{show_all_buffers = true}<CR>", { desc = "Find Buffers" }),
      vim.keymap.set('n', '<leader>fc', ":lua require 'telescope.builtin'.commands{}<CR>", { desc = "Shows Telescope Commands" }),
      vim.keymap.set('n', '<leader>ff', ":lua require 'telescope.builtin'.find_files{}<CR>", { desc = "Find Files in the same directory" }),
      vim.keymap.set('n', '<leader>flf', ":lua require 'telescope.builtin'.live_grep{}<CR>", { desc = "Find word in files" }),
      vim.keymap.set('n', '<leader>flg', ":lua require 'telescope.builtin'.git_files{}<CR>", { desc = "Fuzzy find git files" }),
      vim.keymap.set('n', '<leader>fh', ":lua require 'telescope.builtin'.help_tags{}<CR>", { desc = "Help Tags" }),
      vim.keymap.set('n', '<leader>fk', ":lua require 'telescope.builtin'.keymaps{}<CR>", { desc = "Show Keymaps" }),
      vim.keymap.set('n', '<leader>fo', ":lua require 'telescope.builtin'.oldfiles{}<CR>", { desc = "Old Files" }),
      vim.keymap.set('n', '<leader>fr', ":lua require 'telescope.builtin'.registers{}<CR>", { desc = "Show registers" }),
      vim.keymap.set('n', '<leader>fs', ":lua require 'telescope.builtin'.grep_sting{}<CR>", { desc = "Search sting under cursor or selection" }),
      vim.keymap.set('n', '<leader>ft', ":lua require 'telescope.builtin'.treesitter{}<CR>", { desc = "Find Functions & Variables" }),
      vim.keymap.set('n', '<leader>fzh', ":lua require 'telescope.builtin'.command_history{}<CR>", { desc = "Show command history" }),
      vim.keymap.set('n', '<leader>fzq', ":lua require 'telescope.builtin'.quickfixhistory{}<CR>", { desc = "List all quickfix lists" }),
      vim.keymap.set('n', '<leader>fzs', ":lua require 'telescope.builtin'.search_history{}<CR>", { desc = "Show search history" }),
      vim.keymap.set('n', '<leader>fm', ":lua require 'telescope.builtin'.marks{}<CR>", { desc = "List marks and their value" }),
      vim.keymap.set('n', '<leader>fj', ":lua require 'telescope.builtin'.jumplist{}<CR>", { desc = "List jumplist" }),
    },
}
