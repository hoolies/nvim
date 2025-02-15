return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  transparent = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent",
  },
  config = function ()
      vim.cmd[[colorscheme tokyonight-storm]]
      -- Custom colors
      vim.cmd[[highlight LineNr guifg=#29465B]]
      vim.cmd[[highlight CursorColumn guifg=#737CA1]]
      vim.cmd[[highlight CursorLineNr guifg=#FF00FF]]
      vim.cmd[[highlight IncSearch guibg=#FF00FF]]
  end
}
