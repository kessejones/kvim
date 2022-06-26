local Comment = require("Comment")
local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
    local keymap_toggle = "<C-_>"
    if vim.fn.has("macunix") == 1 then
        -- NOTE: ^/ is equal to ctrl+/ (hack for macos)
        keymap_toggle = "^/"
    end

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
