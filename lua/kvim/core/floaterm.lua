local keymappings = require("kvim.keymappings")
local M = {}

function M.init()
    local keymap_toggle = "<C-\\>"
    if vim.fn.has("mac") == 1 then
        -- NOTE: ^\ is equal to ctrl+\ (hack for macos)
        keymap_toggle = "^\\"
    end

    keymappings.load({
        terminal_mode = {
            ["<C-o>"] = "<C-\\><C-n>:FloatermNew<CR>",
            ["<C-p>"] = "<C-\\><C-n>:FloatermPrev<CR>",
            ["<C-n>"] = "<C-\\><C-n>:FloatermNext<CR>",
            ["<C-e>"] = "<C-\\><C-n>",
        },
    })

    vim.g.floaterm_title = "Terminal ($1/$2)"
    vim.g.floaterm_width = 0.99
    vim.g.floaterm_height = 0.99
    vim.g.floaterm_keymap_toggle = keymap_toggle
end

return M
