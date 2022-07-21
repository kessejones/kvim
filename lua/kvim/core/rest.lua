local rest = require("rest-nvim")
local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
    rest.setup()

    keymappings.load({
        normal_mode = {
            ["<Leader>n"] = rest.run,
        },
    })
end

return M
