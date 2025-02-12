return  { 'neovim/nvim-lspconfig', config = function()

    local lspconfig = require('lspconfig')

    -- Python (pyright)
    lspconfig.pyright.setup({
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
          },
        },
      },
    })

    -- Lua (lua_ls)
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
            path = vim.split(package.path, ';'),
          },
          diagnostics = {
            globals = {'vim'},
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file('', true),
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })

    -- Go (gopls)
    lspconfig.gopls.setup({
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
        },
      },
    })

    -- Rust (rust_analyzer)
    lspconfig.rust_analyzer.setup({
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            loadOutDirsFromCheck = true,
          },
          procMacro = {
            enable = true,
          },
        },
      },
    })

    -- C (clangd)
    lspconfig.clangd.setup({})

    -- JavaScript/TypeScript (ts_ls)
    lspconfig.ts_ls.setup({
      settings = {
        javascript = {
          format = { enable = true },
        },
        typescript = {
          format = { enable = true },
        },
      },
    })

    -- HTML (html)
    lspconfig.html.setup({})

    -- CSS (cssls)
    lspconfig.cssls.setup({})

    -- Bash (bashls)
    lspconfig.bashls.setup({
      settings = {
        bash = {
          enable = true,
        },
      },
    })

    -- PowerShell (powershell_es)
    lspconfig.powershell_es.setup({
      settings = {
        powershell = {
          scriptAnalysis = {
            enable = true,
          },
        },
      },
    })

    -- Elixir (elixirls)
    lspconfig.elixirls.setup({
      settings = {
        elixirLS = {
          dialyzerEnabled = true,
          fetchDeps = true,
          enableTestLenses = true,
        },
      },
    })

  end
}
