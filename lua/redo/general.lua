local opt = vim.opt
local cmd = vim.cmd

-- relative number addressing, but it also shows you your current line number
opt.number = true
opt.relativenumber = true

-- ehh maybe not, idk yet
opt.cursorline = true
opt.guicursor = ""

opt.conceallevel = 1

-- indentation
opt.softtabstop = 4
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
-- opt.autoindent = true
opt.smartindent = true

opt.scrolloff = 10

-- opt.wrap = false

-- swapfiles, backupfiles, nope thanks
opt.swapfile = false
opt.backup = false

opt.undodir = os.getenv("HOME") .. "/.nvim/undo"
opt.undofile = true

opt.incsearch = true
opt.hlsearch = false

opt.termguicolors = true

cmd("set list listchars=tab:\\ \\")
--opt.tabline = "ho"
-- theme init
cmd("colorscheme habamax.nvim")
