local set = vim.opt
local g = vim.g
local config = require("core.utils").load_config()

-------------------------------------- globals -----------------------------------------
g.nvchad_theme = config.ui.theme
g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
g.toggle_theme_icon = "   "
g.transparency = config.ui.transparency

-------------------------------------- options ------------------------------------------
set.laststatus = 3 -- global statusline

set.clipboard = "unnamedplus"
set.cursorline = true
set.cursorcolumn = true

-- Indenting
set.autoindent = true
set.expandtab = true
set.shiftwidth = 2
set.smartindent = true
set.tabstop = 2
set.softtabstop = 2
set.fillchars = { eob = " " }
set.ignorecase = true
set.smartcase = true
set.mouse = "a"

-- Numbers
set.number = true
--set.numberwidth = 2                                   -- Default settings
set.ruler = true
set.relativenumber = true 	                            -- Set relative numbers
set.numberwidth = 5                                     -- Width of the number on the left
vim.wo.colorcolumn = '0'

-- disable nvim intro
set.shortmess:append "sI"
set.signcolumn = "yes"
set.splitbelow = true
set.splitright = true
set.termguicolors = true
set.timeoutlen = 400

-- Various
set.spell = true
set.visualbell = true
set.fileencoding = 'utf-8'
set.showmode = true
set.showtabline = 0


-- undo history settings
set.undofile = true
set.undolevels = 1000
set.undoreload = 1000
set.undodir = '/home/hoolies/.config/nvim/undodir'

-- interval for writing swap file to disk, also used by gitsigns
set.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
set.whichwrap:append "<>[]hl"

g.mapleader = " "

-- disable some default providers
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH

-------------------------------------- autocmds ------------------------------------------
local autocmd = vim.api.nvim_create_autocmd

-- dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

-- reload some chadrc options on-save
autocmd("BufWritePost", {
  pattern = vim.tbl_map(function(path)
    return vim.fs.normalize(vim.loop.fs_realpath(path))
  end, vim.fn.glob(vim.fn.stdpath "config" .. "/lua/custom/**/*.lua", true, true, true)),
  group = vim.api.nvim_create_augroup("ReloadNvChad", {}),

  callback = function(opts)
    local fp = vim.fn.fnamemodify(vim.fs.normalize(vim.api.nvim_buf_get_name(opts.buf)), ":r") --[[@as string]]
    local app_name = vim.env.NVIM_APPNAME and vim.env.NVIM_APPNAME or "nvim"
    local module = string.gsub(fp, "^.*/" .. app_name .. "/lua/", ""):gsub("/", ".")

    require("plenary.reload").reload_module "base46"
    require("plenary.reload").reload_module(module)
    require("plenary.reload").reload_module "custom.chadrc"

    config = require("core.utils").load_config()

    vim.g.nvchad_theme = config.ui.theme
    vim.g.transparency = config.ui.transparency

    -- statusline
    require("plenary.reload").reload_module("nvchad.statusline." .. config.ui.statusline.theme)
    vim.set.statusline = "%!v:lua.require('nvchad.statusline." .. config.ui.statusline.theme .. "').run()"

    -- tabufline
    if config.ui.tabufline.enabled then
      require("plenary.reload").reload_module "nvchad.tabufline.modules"
      vim.set.tabline = "%!v:lua.require('nvchad.tabufline.modules').run()"
    end

    require("base46").load_all_highlights()
    -- vim.cmd("redraw!")
  end,
})

-------------------------------------- commands ------------------------------------------
local new_cmd = vim.api.nvim_create_user_command

new_cmd("NvChadUpdate", function()
  require "nvchad.updater"()
end, {})
