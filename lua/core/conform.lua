return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" }, -- Load before writing buffer
  cmd = { "ConformInfo" },
  config = function()
    local conform = require("conform")

    conform.setup({
      -- Define formatters for each filetype
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format", "black" }, -- ruff_format is faster, fallback to black
        go = { "goimports", "gofmt" },
        elixir = { "mix" }, -- ElixirLS handles this, but explicit is fine
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        sh = { "shfmt" },
        -- Ansible files often have a .yaml or .yml extension, so yamlls/prettier will handle them.
        -- If you need specific Ansible formatting, you might need a custom formatter.
      },
      -- Global options for conform
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true, -- Use LSP formatting if no conform formatter is found
      },
      -- You can add more options here, like custom formatters or logging
    })

    -- Optional: Set up keymap for manual formatting
    vim.api.nvim_set_keymap("n", "<leader>F", "<cmd>lua require('conform').format()<CR>", { noremap = true, silent = true, desc = "Format file" })
  end,
}
