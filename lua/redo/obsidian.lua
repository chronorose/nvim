require("obsidian").setup({
    workspaces = {
        {
            name = "main",
            path = "~/Documents/vyle_obsidian/vyle",
        }
    },

    completion = {
        nvim_cmp = true,
        min_chars = 2,
    },
    note_path_func = function(spec)
    -- This is equivalent to the default behavior.
        local path = spec.dir / tostring(spec.title)
        return path:with_suffix(".md")
    end,


    picker = {
        name = "telescope.nvim",
    },
})
