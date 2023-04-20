local treesj = require("treesj")
local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
    treesj.setup({
        use_default_keymaps = false,
    })

    keymappings.load({
        normal_mode = {
            ["<LocalLeader>ss"] = treesj.split,
            ["<LocalLeader>sj"] = treesj.join,
        },
    })
end

return M
