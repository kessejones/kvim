local Comment = require("Comment")
local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
    local keymap_toggle = "<Leader>/"

    Comment.setup({
        toggler = {
            line = keymap_toggle,
        },
    })

    keymappings.load({
        visual_mode = {
            [keymap_toggle] = "<Plug>(comment_toggle_linewise_visual)",
        },
    })
end

return M
