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
map('n', '<up>', '<nop>')
map('n', '<down>', '<nop>')
map('n', '<left>', '<nop>')
map('n', '<right>', '<nop>')

-- Navigate in Insert Mode 
map('i', '<C-h>', '<Left>')
map('i', '<C-j>', '<Down>')
map('i', '<C-k>', '<Up>')
map('i', '<C-l>', '<Right>')

-- Navigate in Terminal
map('t', '<C-h>', '<C-\\><C-n><C-w><C-h>')
map('t', '<C-j>', '<C-\\><C-n><C-w><C-j>')
map('t', '<C-k>', '<C-\\><C-n><C-w><C-k>')
map('t', '<C-l>', '<C-\\><C-n><C-w><C-l>')

-- Open NeoTree
map('n', '<leader>e', ':Neotree toggle<CR>')

-- Clear search highlighting with <leader> and c
map('n', '<leader><Esc>', ':nohl<CR>')

-- Buffer manipulation
map('n', '<leader>bj', ':bnext<CR>')
map('n', '<leader>bk', ':bprevious<CR>')
map('n', '<leader>bd', ':bdelete<CR>')
map('n', '<leader>bw', ':bwipeout<CR>')
map('n', '<leader>bb', ':buffers<CR>')

-- Terminal mappings
map('n', '<leader>h', ':split <CR> :resize -10<CR> :terminal<CR> a')
map('n', '<leader>v', ':vsplit <CR> :terminal<CR> a')

-- Toggle the undotree
map('n', '<leader>u', ':UndotreeToggle<CR>')

-- Oil
map('n', '<leader>0', ':Oil<CR>')

-- Toggle the minimap
map('n', '<leader>m', ':MinimapToggle<CR>')

-- Glow MarkDown
map('n', '<leader>M', ':Glow<CR>')

-- Lazy git
map('n', '<leader>lg', ':LazyGit<CR>')

-- Indentation
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Comments 
map("n", "<C-_>", "gcc", { noremap = false})
map("v", "<C-_>", "gcc", { noremap = false})
