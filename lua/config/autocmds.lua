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

-- Highlight on Yank
augroup('YankHighlightedText',{clear=true})
  autocmd('TextYankPost', {
    callback = function()
      vim.highlight.on_yank({ higroup='Search', timeout = 300 })
    end
})

-- Remove whitespace on save
autocmd({
  'BufWritePre',
  'BufEnter',
  }, {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

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
