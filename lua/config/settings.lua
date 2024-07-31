----------------------------------=={ Setup Local }==-------------------------------
local opt = vim.wo
local set = vim.opt


----------------------------------=={   Settings   }==------------------------------


-- Behavior
set.autoindent = true
set.scrolloff = 5
set.showmatch = true
set.splitright = true
set.splitbelow = true
set.autochdir = true
set.iskeyword = "-"
set.modifiable = true
set.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"


-- Buffer
set.autoread = true
set.hidden = true
set.updatetime = 250


-- Copy to clipboard
set.clipboard = "unnamedplus"


-- Columns
set.cursorcolumn = true
set.cursorline = true


-- Line wraps
set.wrapscan = true
opt.wrap = true
opt.linebreak = true
opt.list = false


-- Number column
opt.colorcolumn = '0'
set.number = true
set.numberwidth = 5
set.relativenumber = true
set.ruler = true
set.signcolumn = "yes"


-- Search
set.hlsearch = true
set.ignorecase = true
set.incsearch = true
set.smartcase = true


-- Tabs / Identation
set.expandtab = true
set.shiftwidth = 2
set.smartindent = true
set.softtabstop = 2
set.tabstop = 2
set.wrap = false

-- Undo history settings
set.undodir = '/home/hoolies/.config/nvim/undodir'
set.undofile = true
set.undolevels = 1000
set.undoreload = 1000


-- Various
set.fileencoding = 'utf-8'
set.showmode = true
set.showtabline = 0
set.spell = true
set.termguicolors = true
set.visualbell = true
set.completeopt = "menuone,noinsert,noselect"
