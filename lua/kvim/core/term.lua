local keymappings = require("kvim.keymappings")
local term = require("term")

local M = {}

function M.init()
    term.setup({
        width = 0.9,
        height = 0.9,
        position = "center",
        -- border_style = "rounded",
    })

    local keymap_toggle = "<C-\\>"
    if vim.fn.has("mac") == 1 then
        -- NOTE: ^\ is equal to ctrl+\ (hack for macos)
        keymap_toggle = "^\\"
    end

    keymappings.load({
        normal_mode = {
            [keymap_toggle] = term.toggle,
        },
        terminal_mode = {
            [keymap_toggle] = term.toggle,
            ["<C-n>"] = term.next,
            ["<C-p>"] = term.prev,
            ["<C-o>"] = term.new,
        },
    })
end

return M
