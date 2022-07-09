local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
    keymappings.load({
        normal_mode = {
            ["<Leader>u"] = ":DBUIToggle<CR>",
        },
    })
end

return M
