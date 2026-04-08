local opt = vim.opt
local cmd = vim.cmd

-- relative number addressing, but it also shows you your current line number
opt.number = true
opt.relativenumber = true

-- ehh maybe not, idk yet
opt.cursorline = true
opt.guicursor = ""

opt.conceallevel = 1

vim.opt.showbreak = ""

-- indentation
opt.softtabstop = 2
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- opt.wrap = false

-- swapfiles, backupfiles, nope thanks
opt.swapfile = false
opt.backup = false

opt.undodir = os.getenv("HOME") .. "/.nvim/undo"
opt.undofile = true

opt.incsearch = true
opt.hlsearch = false

opt.scrolloff = 10

opt.termguicolors = true

--opt.tabline = "ho"
-- theme init
cmd("colorscheme habamax.nvim")

vim.api.nvim_set_hl(0, "DiffAdd",    { bg = "#2d3f34", fg = "#a6e3a1" })
vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#3f2d2d", fg = "#f38ba8" })
vim.api.nvim_set_hl(0, "DiffChange", { bg = "#2d353f", fg = "#89b4fa" })
vim.api.nvim_set_hl(0, "DiffText",   { bg = "#3e4451", fg = "#ffffff", bold = true })
