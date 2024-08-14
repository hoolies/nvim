--------------------------------------------------
-- AUTOCMDS
--------------------------------------------------
local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- Transparency
-- autocmd("VimEnter", {
--   callback = function()
--     vim.cmd("hi! Normal guibg=NONE ctermbg=NONE")
--     vim.cmd("hi! NonText guibg=NONE ctermbg=NONE")
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
autocmd({
  'BufWritePre',
  'BufEnter',
},
{
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})
