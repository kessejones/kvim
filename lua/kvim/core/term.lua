local keymappings = require("kvim.keymappings")
local term = require("term")

local M = {}

function M.init()
    term.setup({
        width = 0.9,
        height = 0.9,
        position = "center",
    })

    local keymap_toggle = "<Leader>;"

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
