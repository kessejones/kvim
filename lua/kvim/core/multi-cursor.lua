local M = {}

local mc = require("multiple-cursors")

function M.init()
    mc.setup({})

    require("kvim.keymappings").load({
        normal_mode = {
            ["<C-j>"] = mc.add_cursor_down,
            ["<C-k>"] = mc.add_cursor_up,
            ["<C-s>a"] = mc.add_cursors_to_matches,
            ["<C-s>n"] = mc.add_cursor_and_jump_to_next_match,
            ["<C-s>N"] = mc.add_cursor_and_jump_to_next_match,
            ["<C-s>l"] = mc.lock,
        },
    })
end

return M
