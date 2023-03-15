local spectre = require("spectre")
local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
    spectre.setup()

    keymappings.load({
        normal_mode = {
            [",fs"] = spectre.open,
            [",ff"] = spectre.open_file_search,
        },
    })
end

return M
