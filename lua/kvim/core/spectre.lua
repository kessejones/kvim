local spectre = require("spectre")
local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
    keymappings.load({
        normal_mode = {
            [",s"] = spectre.open,
            [",f"] = spectre.open_file_search,
        },
    })
end

return M
