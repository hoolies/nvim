---@type ChadrcConfig
local M = {}

M.ui = { theme = 'tokyonight' }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

-- Highlights
vim.cmd[[highlight LineNR guifg=#29465B]]

return M
