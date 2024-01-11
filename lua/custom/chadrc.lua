---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

-- Highlights
vim.cmd[[highlight LineNr guifg=#29465B]]               -- The Numbers on the left
vim.cmd[[highlight CursorColumn guifg=#737CA1]]         -- The cursorcolumn color
vim.cmd[[highlight CursorLine guifg=#737CA1]]           -- The cursorline color
vim.cmd[[highlight CursorLineNr guifg=#FF00FF]]

return M
