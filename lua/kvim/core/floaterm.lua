local keymappings = require("kvim.keymappings")
local M = {}

function M:init()
    keymappings.load({
        terminal_mode = {
            ["<C-n>"] = "<C-\\><C-n>:FloatermNew<CR>",
            ["<C-k>"] = "<C-\\><C-n>:FloatermKill<CR>",
            ["<C-l>"] = "<C-\\><C-n>:FloatermNext<CR>",
            ["<C-h>"] = "<C-\\><C-n>:FloatermPrev<CR>",
        },
    })

    vim.g.floaterm_title = "Terminal ($1/$2)"
    vim.g.floaterm_width = 0.99
    vim.g.floaterm_height = 0.99
    vim.g.floaterm_keymap_toggle = "<C-\\>"
end

return M
