local spectre = require("spectre")
local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
    spectre.setup()

    keymappings.load({
        normal_mode = {
            ["<LocalLeader>fs"] = spectre.open,
            ["<LocalLeader>ff"] = spectre.open_file_search,
        },
    })
end

return M
