--------------------------------------------------
-- AUTOCMDS --------------------------------------
--------------------------------------------------

local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- Telescope when you run nvim without a file as an argument
autocmd("VimEnter", {
  callback = function()
    if vim.fn.argv(0) == "" then
      require("telescope.builtin").oldfiles()
    elseif vim.fn.isdirectory(vim.v.argv[2]) == 1 then
      vim.api.nvim_set_current_dir(vim.v.argv[2])
    end
  end,
})

-- Check if we need to reload the file when it changed
-- autocmd { "FocusGained", "TermClose", "TermLeave" }, {
--   group = augroup("checktime"),
--   callback = function()
--     if vim.o.buftype ~= "nofile" then
--       vim.cmd("checktime")
--     end
--   end,
-- })

-- Highlight on Yank
augroup('YankHighlightedText',{clear=true})
  autocmd('TextYankPost', {
    callback = function()
      vim.highlight.on_yank({ higroup='Search', timeout = 300 })
    end
})

-- Remove whitespace on save
-- autocmd({
--   'BufWritePre',
--   'BufEnter',
--   }, {
--   pattern = '',
--   command = ":%s/\\s\\+$//e"
-- })

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})

-- You open the file at the point you where last
autocmd("BufReadPost", {command="normal! g'\""})

-- Turn off relative numbers to terminal
autocmd("TermOpen", { command = "setlocal listchars= nonumber norelativenumber" })

-- Turn off relative numbers to oil buffers
autocmd("FileType", {
  pattern = "oil",
  callback = function ()
    vim.wo.number = false
    vim.wo.relativenumber = false
  end,
})

-- close some filetypes with <q>
-- autocmd("FileType", {
--   group = augroup("close_with_q"),
--   pattern = {
--     "PlenaryTestPopup",
--     "checkhealth",
--     "dbout",
--     "gitsigns-blame",
--     "grug-far",
--     "help",
--     "lspinfo",
--     "neotest-output",
--     "neotest-output-panel",
--     "neotest-summary",
--     "notify",
--     "qf",
--     "spectre_panel",
--     "startuptime",
--     "tsplayground",
--   },
--   callback = function(event)
--     vim.bo[event.buf].buflisted = false
--     vim.schedule(function()
--       vim.keymap.set("n", "q", function()
--         vim.cmd("close")
--         pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
--       end, {
--         buffer = event.buf,
--         silent = true,
--         desc = "Quit buffer",
--       })
--     end)
--   end,
-- })

-- Fix conceallevel for json files
-- autocmd({ "FileType" }, {
--   group = augroup("json_conceal"),
--   pattern = { "json", "jsonc", "json5" },
--   callback = function()
--     vim.opt_local.conceallevel = 0
--   end,
-- })

-- Auto create dir when saving a file, in case some intermediate directory does not exist
-- autocmd({ "BufWritePre" }, {
--   group = augroup("auto_create_dir"),
--   callback = function(event)
--     if event.match:match("^%w%w+:[\\/][\\/]") then
--       return
--     end
--     local file = vim.uv.fs_realpath(event.match) or event.match
--     vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
--   end,
-- })

--------------------------------------------------
-- DISABLED --------------------------------------
--------------------------------------------------

-- Transparency
-- autocmd("VimEnter", {
--   callback = function()
--     vim.cmd("hi! Normal guibg=NONE ctermbg=NONE")
--     vim.cmd("hi! NonText guibg=NONE ctermbg=NONE")
--   end,
-- })

-- Set what kind of ASCII characters are keywords I set this in settings, depends the plugins some times is required to have an autocommand to overwrite
-- autocmd("VimEnter", {
--   command = 'set iskeyword=@,48-57,192-255'
-- })
