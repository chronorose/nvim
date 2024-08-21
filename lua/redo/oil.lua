require("oil").setup({
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    constrain_cursor = "editable",
    keymaps = {
        ["<CR>"] = "actions.select",
        ["<C-v>"] = {"actions.select", opts = { vertical = true }},
        ["<Esc>"] = "actions.close",
        ["<BS>"] = "actions.parent",
        ["g."] = "actions.toggle_hidden",
    }
})
