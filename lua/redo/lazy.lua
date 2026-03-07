-- bootstrapping
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- plugin management and stuff
require("lazy").setup({
  spec = {

    -- everything lsp related
    {"VonHeikemen/lsp-zero.nvim", branch = 'v4.x'},
    {"neovim/nvim-lspconfig"},

    -- treesitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- autopairs yay
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },

    -- completion
    {"hrsh7th/nvim-cmp"},

    {"hrsh7th/cmp-nvim-lsp"},

    {
      "scalameta/nvim-metals",
      ft = { "sbt", "scala" },
      init = function()
        vim.opt_global.shortmess:remove "F"
      end,
      opts = function()
        local opts = require("metals").bare_config()
        opts.init_options.statusBarProvider = "log-message"
        opts.settings = {
          ["autoImportBuild"] = "all",
        }
        return opts
      end,

      config = function(self, opts)
        local nvim_metals_group =
          vim.api.nvim_create_augroup("nvim-metals", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
          pattern = self.ft,
          callback = function()
            require("metals").initialize_or_attach(opts)
          end,
          group = nvim_metals_group,
        })
      end,
    },

    {'nvim-tree/nvim-web-devicons'},

    { "ntk148v/habamax.nvim", dependencies={ "rktjmp/lush.nvim" } },

    {
        "sustech-data/wildfire.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("wildfire").setup()
        end,
    },

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
      'stevearc/oil.nvim',
      opts = {},
    },

    },

    checker = { enabled = false },
})
