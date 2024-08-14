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

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Navigate in Insert Mode 
map('i', '<C-h>', '<Left>')
map('i', '<C-j>', '<Down>')
map('i', '<C-k>', '<Up>')
map('i', '<C-l>', '<Right>')
map('i', 'jj', '<Esc>')

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Buffer manipulation
map('n', '<leader>bl', ':bnext<CR>', { desc = "Next Buffer" })
map('n', '<leader>bh', ':bprevious<CR>', { desc = "Previous Buffer" })
map('n', '<leader>bd', ':bdelete<CR>', { desc = "Delete Buffer" })
map('n', '<leader>bD', ':bdelete<CR>:q!', { desc = "Delete Buffer & Close Window" })
map('n', '<leader>bw', ':bwipeout<CR>', { desc = "Wipeout Buffer" })
map('n', '<leader>bb', ':enew<CR>', { desc = "New Window & Buffer" })
map("n", "<A-ESC>", ":%bd|e#|bd# <CR>", { desc = "Delete all buffer except current" })

-- Navigate in Terminal
map('t', '<C-h>', '<C-\\><C-n><C-w><C-h>')
map('t', '<C-j>', '<C-\\><C-n><C-w><C-j>')
map('t', '<C-k>', '<C-\\><C-n><C-w><C-k>')
map('t', '<C-l>', '<C-\\><C-n><C-w><C-l>')


-- Toggle the undotre
map('n', '<leader>u', ':UndotreeToggle<CR>', { desc = "Opens UndoTree" })

-- Clear search with <esc>
map( "n", "<Esc>", "<cmd>nohl<cr>", { desc = "Escape and Clear hlsearch" })

-- Terminal mappings
map('n', '<leader>th', ':split <CR> :resize -10<CR> :terminal<CR> a', { desc = "Opens terminal in a buffer horizontaly" })
map('n', '<leader>tv', ':vsplit <CR> :terminal<CR> a', { desc = "Opens terminal vertically in split screen" })

-- Oil
map('n', '<leader>0', ':Oil<CR>', { desc = "Opens Oil in a new buffer" })
map('n', '<leader>e', ':Oil --float<CR>', { desc = "Opens Oil in floating mode" })

-- Toggle the minimap
map('n', '<leader>m', ':MinimapToggle<CR>', { desc = "Toggles MiniMap" })

-- Glow MarkDown
map('n', '<leader>M', ':Glow<CR>', { desc = "Activates MarkDown Rendering" })

-- Indentation
map("v", "<", "<gv")
map("v", ">", ">gv")
