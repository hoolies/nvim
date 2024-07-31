-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to spacebar
map('', '<SPACE>', '<nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Navigate in Insert Mode 
map('i', '<C-h>', '<Left>')
map('i', '<C-j>', '<Down>')
map('i', '<C-k>', '<Up>')
map('i', '<C-l>', '<Right>')

-- Navigate in Command mode
map('c', '<C-h>', '<Left>')
map('c', '<C-j>', '<Down>')
map('c', '<C-k>', '<Up>')
map('c', '<C-l>', '<Right>')

-- Open NeoTree
map('n', '<leader>e', ':Neotree toggle<CR>')

-- Moving between buffers
map('n', '<S-bs>', ':bp<CR>', {silent = true, noremap = true})    -- go to previous buffer')
map('n', '<bs>', ':bn<CR>', {silent = true, noremap = true})  -- go to next buffer')

-- Clear search highlighting with <leader> and c
map('n', '<leader><Esc>', ':nohl<CR>')

-- Terminal mappings
map('n', '<C-t>', ':terminal<CR>')      -- open
map('t', '<Esc>', '<C-d>')              -- exit

-- Toggle the undotree
map('n', '<leader>u', ':UndotreeToggle<CR>')

-- Toggle the minimap
map('n', '<leader>m', ':MinimapToggle<CR>')

-- Lazy git
map('n', '<leader>lg', ':LazyGit<CR>')

-- Indentation
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Comments 
map("n", "<C-_>", "gcc", { noremap = false})
map("v", "<C-_>", "gcc", { noremap = false})
