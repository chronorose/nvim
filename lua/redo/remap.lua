local g = vim.g
local nkmap = vim.api.nvim_set_keymap
local kmap = vim.keymap.set

g.mapleader = " "

-- bindings for wrapped text
kmap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
kmap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

kmap("n", "<leader>.", "<cmd>Oil<CR>", { silent = true})
kmap("n", "<Tab>", "v%", {silent = true})

kmap("n", "<leader>dq", "<cmd>diffoff!<CR>", { silent = true})

local function open_tmux_here()
    local dir
    if vim.bo.filetype == "oil" then
        dir = require("oil").get_current_dir()
    else
        dir = vim.fn.expand("%:p:h")
    end

    vim.system({"tmux", "new-window", "-c", dir}, { text = true }, function(obj)
        if obj.code ~= 0 then
            vim.schedule(function()
                print("Tmux error: " .. obj.stderr)
            end)
        end
    end)
end

vim.keymap.set("n", "<leader>t", open_tmux_here, { desc = "Open tmux pane in current dir" })

