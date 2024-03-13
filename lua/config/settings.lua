----------------------------------=={ Setup Local }==-------------------------------
local opt = vim.wo                                    -- Set opt as vim.wo, cause lazy again
local set = vim.opt		                                -- Set set as vim.opt, cause lazy


----------------------------------=={  Settings   }==-------------------------------


-- Behavior
set.autoindent = true                                   -- Auto indent lines
set.scrolloff = 5
set.showmatch = true


-- Buffer
set.autoread = true                                     -- Automatically update file
set.hidden = true                                       -- Enable background buffers
set.updatetime = 250                                    -- Automatically update 


-- Copy to clipboard
set.clipboard = "unnamedplus"


-- Columns
set.cursorcolumn = true
set.cursorline = true


-- Highlights
vim.cmd[[highlight LineNr guifg=#29465B]]               -- The Numbers on the left
vim.cmd[[highlight CursorColumn guifg=#737CA1]]         -- The cursorcolumn color
vim.cmd[[highlight CursorLine guifg=#737CA1]]           -- The cursorline color
vim.cmd[[highlight CursorLineNr guifg=#FF00FF]]         -- The number of actual line


-- Line wraps
set.wrapscan = true
opt.wrap = true                                      -- Wrap the line
opt.linebreak = true
opt.list = false


-- Number column
set.number = true	        	                            -- Set the number
set.numberwidth = 5                                     -- Width of the number on the left
set.relativenumber = true	                              -- Set relative numbers
set.ruler = true                                        --
opt.colorcolumn = '0'                                --


-- Search
set.hlsearch = true                                     -- Highlight search
set.incsearch = true                                    -- Set incremental


-- Tabs
set.expandtab = true                                    -- Use Spaces instead of tabs
set.shiftwidth = 4                                      -- Round Indent
set.softtabstop = 4
set.tabstop = 4     		      	                        -- Tab space


-- Undo history settings
set.undofile = true
set.undolevels = 1000
set.undoreload = 1000
set.undodir = '/home/hoolies/.config/nvim/undodir'


-- Various
set.spell = true
set.visualbell = true
set.fileencoding = 'utf-8'
set.termguicolors = true
set.showmode = true
set.showtabline = 0
