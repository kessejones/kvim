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

    local comment_ft = require("Comment.ft")
    comment_ft.set("http", { "# %s", "# %s" })
    comment_ft.set("mysql", { "-- %s", "-- %s" })
    comment_ft.set("asm", { "# %s", "# %s" })
    comment_ft.set("hurl", { "# %s", "# %s" })

    keymappings.load({
        visual_mode = {
            [keymap_toggle] = "<Plug>(comment_toggle_linewise_visual)",
        },
    })
end

return M
