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


-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Open NeoTree
map('n', '<leader>e', ':Neotree toggle<CR>')

-- Moving between buffers
map('n', '<bs>', ':bp<CR>', {silent = true, noremap = true})    -- go to previous buffer')
map('n', '<S-bs>', ':bn<CR>', {silent = true, noremap = true})  -- go to next buffer')

-- Clear search highlighting with <leader> and c
map('n', '<leader><Esc>', ':nohl<CR>')

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K')  -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H')  -- change horizontal to vertical

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Close current window or tab with <leader> and w
map('n', '<leader>w', ':close<CR>')

-- Close all windows save and exit
map('n', '<leader>x', ':xa!<CR>')

-- Terminal mappings
map('n', '<C-t>', ':terminal<CR>')      -- open
map('t', '<Esc>', '<C-d>')              -- exit

-- Toggle the undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Indentation
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Comments 
map("n", "<C-_>", "gcc", { noremap = false})
map("v", "<C-_>", "gcc", { noremap = false})
