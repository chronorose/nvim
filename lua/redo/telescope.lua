local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                -- some remaps for telescope's window
                ["<esc>"] = actions.close,
                ["<C-s>"] = actions.cycle_previewers_next,
                ["<C-a>"] = actions.cycle_previewers_prev,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-u>"] = actions.results_scrolling_up,
                ["<C-d>"] = actions.results_scrolling_down,
            },
        }
    }
})

local builtin = require("telescope.builtin")

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
