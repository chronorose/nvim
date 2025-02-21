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
    -- {
    --   "scalameta/nvim-metals",
    --   dependencies = {
    --     "nvim-lua/plenary.nvim",
    --   },
    --   ft = { "scala", "sbt", "java"}
    --   opts = function()
    --     local metals_config = require("metals").bare_config()
    --     metals_config.on_attach = function(client, bufnr)
    --     end
    -- },

    -- mason, stuff that downloads lsps and everything else automatically
    {"williamboman/mason.nvim"},
    { "williamboman/mason-lspconfig.nvim" },

    -- devicons for telescope
    {'nvim-tree/nvim-web-devicons'},

    -- current theme that i use
    { "ntk148v/habamax.nvim", dependencies={ "rktjmp/lush.nvim" } },

    {
        "sustech-data/wildfire.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("wildfire").setup()
        end,
    },

    -- mr. telescope himself
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && npm install",
      init = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    },

    -- and mista oil right aftah him
    {
      'stevearc/oil.nvim',
      opts = {},
    },

    {"epwalsh/obsidian.nvim"},

    },
    -- automatically check for plugin updates
    checker = { enabled = false },
})
