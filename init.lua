-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Imports configurations
require('config.autocmds')
require('config.keymaps')
require('config.settings')

-- Load Lazy
 require("lazy").setup('plugins', opts)

local opts = {
  root = vim.fn.stdpath("data") .. "/lazy",
  defaults = {
    lazy = false,
    version = nil,
    cond = nil, ---@type boolean|fun(self:LazyPlugin):boolean|nil
  },
  spec = nil, ---@type LazySpec
  lockfile = vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
  ---@type number? limit the maximum amount of concurrent tasks
  concurrency = jit.os:find("Windows") and (vim.uv.available_parallelism() * 2) or nil,
  git = {
    log = { "-8" }, -- show the last 8 commits
    timeout = 120,
    url_format = "https://github.com/%s.git",
    filter = true,
  },
  dev = {
    ---@type string | fun(plugin: LazyPlugin): string directory where you store your local plugin projects
    path = "~/projects",
    ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
    patterns = {},
    fallback = false,
  },
  install = {
    missing = true,
    colorscheme = { "tokyonight-storm"},
  },
  ui = {
    size = { width = 0.85, height = 0.85 },
    wrap = true,
    border = "none",
    backdrop = 60,
    title = nil, ---@type string only works when border is not "none"
    title_pos = "center", ---@type "center" | "left" | "right"
    pills = true, ---@type boolean
    icons = {
      cmd = " ",
      config = "",
      event = " ",
      ft = " ",
      init = " ",
      import = " ",
      keys = " ",
      lazy = "󰒲 ",
      loaded = "●",
      not_loaded = "○",
      plugin = " ",
      runtime = " ",
      require = "󰢱 ",
      source = " ",
      start = " ",
      task = "✔ ",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    },
    browser = nil, ---@type string?
    throttle = 20,
    custom_keys = {
      ["<localleader>l"] = {
        function(plugin)
          require("lazy.util").float_term({ "lazygit", "log" }, {
            cwd = plugin.dir,
          })
        end,
        desc = "Open lazygit log",
      },

      ["<localleader>t"] = {
        function(plugin)
          require("lazy.util").float_term(nil, {
            cwd = plugin.dir,
          })
        end,
        desc = "Open terminal in plugin dir",
      },
    },
  },
  diff = {
    cmd = "git",
  },
  checker = {
    enabled = false,
    concurrency = nil, ---@type number? set to 1 to check for updates very slowly
    notify = true,
    frequency = 3600,
    check_pinned = false,
  },
  change_detection = {
    enabled = true,
    notify = true,
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true,
    rtp = {
      reset = true,
      ---@type string[]
      paths = {},
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
         "gzip",
         "matchit",
         "matchparen",
         "netrw",
         "netrwPlugin",
         "tarPlugin",
         "tohtml",
         "tutor",
         "zipPlugin",
      },
    },
  },
  readme = {
    enabled = true,
    root = vim.fn.stdpath("state") .. "/lazy/readme",
    files = { "README.md", "lua/**/README.md" },
    skip_if_doc_exists = true,
  },
  state = vim.fn.stdpath("state") .. "/lazy/state.json",
  build = {
    warn_on_override = true,
  },
  profiling = {
    loader = false,
    require = false,
  },
}
