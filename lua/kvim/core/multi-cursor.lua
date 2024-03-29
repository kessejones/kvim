local M = {}

local mc = require("multiple-cursors")

function M.init()
    mc.setup({})

    require("kvim.keymappings").load({
        normal_mode = {
            ["<C-j>"] = mc.add_cursor_down,
            ["<C-k>"] = mc.add_cursor_up,
            ["<Leader>l"] = mc.lock,
        },
    })
end

return M
