local opt = vim.opt

-- relative number addressing, but it also shows you your current line number
opt.number = true
opt.relativenumber = true

-- ehh maybe not, idk yet
opt.cursorline = true

opt.conceallevel = 1

-- indentation
opt.softtabstop = 4
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

vim.cmd("set list listchars=tab:\\ \\")
--opt.tabline = "ho"
-- theme init
vim.cmd("colorscheme habamax.nvim")
