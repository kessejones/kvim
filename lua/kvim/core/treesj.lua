local treesj = require("treesj")
local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
    treesj.setup({
        use_default_keymaps = false,
    })

    keymappings.load({
        normal_mode = {
            [",ss"] = treesj.split,
            [",sj"] = treesj.join,
        },
    })
end

return M
