local M = {}

local mc = require("multiple-cursors")

function M.init()
    mc.setup({
        pre_hook = function()
            require("nvim-autopairs").disable()
        end,
        post_hook = function()
            require("nvim-autopairs").enable()
        end,
    })

    require("kvim.keymappings").load({
        normal_mode = {
            ["<C-S-K>"] = mc.add_cursor_up,
            ["<C-S-J>"] = mc.add_cursor_down,
            ["<C-s>a"] = mc.add_cursors_to_matches,
            ["<C-s>n"] = mc.add_cursor_and_jump_to_next_match,
            ["<C-s>N"] = mc.jump_to_next_match,
            ["<C-s>l"] = mc.lock,
        },
        visual_mode = {
            ["<C-s>a"] = mc.add_cursors_to_matches,
            ["<C-s>n"] = mc.add_cursor_and_jump_to_next_match,
            ["<C-s>N"] = mc.jump_to_next_match,
        },
    })
end

return M
