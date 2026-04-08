local tagged_files = {}

local oil_multi_diff = {
    -- 1. Function to tag a file
    tag = function()
        local oil = require("oil")
        local entry = oil.get_cursor_entry()
        if not entry or entry.type ~= "file" then return end

        local full_path = oil.get_current_dir() .. entry.name

        if #tagged_files >= 4 then
            print("Neovim only supports diffing up to 4 files!")
            return
        end

        table.insert(tagged_files, full_path)
        print(string.format("Added to diff (%d/4): %s", #tagged_files, entry.name))
    end,

    -- 2. Function to execute the diff
    run = function()
        if #tagged_files < 2 then
            print("Tag at least 2 files first!")
            return
        end

        -- Open the first file
        vim.cmd("edit " .. vim.fn.fnameescape(tagged_files[1]))
        vim.cmd("diffthis")

        -- Open subsequent files in vertical splits
        for i = 2, #tagged_files do
            vim.cmd("vsplit " .. vim.fn.fnameescape(tagged_files[i]))
            vim.cmd("diffthis")
        end

        -- Clear the list so we can start fresh next time
        tagged_files = {}
    end,

    -- 3. Function to clear tags
    clear = function()
        tagged_files = {}
        print("Diff tags cleared")
    end
}

-- local oil_diff = function()
--     local oil = require("oil")
--     local entry = oil.get_cursor_entry()
--     if not entry or entry.type ~= "file" then
--         return
--     end
--
--     local dir = oil.get_current_dir()
--     local full_path = dir .. entry.name
--
--     if vim.wo.diff then
--         vim.cmd("vsplit " .. vim.fn.fnameescape(full_path))
--         vim.cmd("diffthis")
--     else
--         vim.cmd("edit " .. vim.fn.fnameescape(full_path))
--         vim.cmd("diffthis")
--     end
-- end

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
        ["<leader>d"] = oil_multi_diff.tag, 
        ["<leader>r"] = oil_multi_diff.run, 
        ["<leader>dq"] = oil_multi_diff.clean, 
    },
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "oil://*",
  callback = function()
    local dir = require("oil").get_current_dir()
    if dir then
      vim.fn.chdir(dir)
    end
  end,
})
