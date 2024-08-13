return {
  'stevearc/oil.nvim',
  -- Options
  opts = {
    float = {
      padding = 3,
      win_option = {
        winblend = 100,
      },
      preview =
      {
        min_width = 0.35,
        max_width = 0.45,
        min_height = 0.6,
        max_height = 0.8,
        border = "rounded",
      },
    },
  },
  -- Optional dependencies
  dependencies = {
    "echasnovski/mini.icons",
    opts = {},
  },
}
