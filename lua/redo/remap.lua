local g = vim.g
local nkmap = vim.api.nvim_set_keymap
-- mapleaders
g.mapleader = " "
g.maplocalleader = "\\"

-- bindings for wrapped text
nkmap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
nkmap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })


-- keybinds for obsidian.nvim plugin
nkmap("n", "<leader>dn", "<cmd>ObsidianToday<CR>", { noremap = true, silent = true })
nkmap("n", "<leader>cn", "<cmd>ObsidianNew<CR>", { noremap = true, silent = true })

-- keybinds for fast checkboxing
nkmap("n", "<C-k>", "i- [ ] <Esc>", { noremap = true, silent = true})
nkmap("i", "<C-k>", "- [ ] ", { noremap = true, silent = true})
