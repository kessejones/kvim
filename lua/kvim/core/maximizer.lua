local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
    keymappings.load({
        normal_mode = {
            ["<Leader>m"] = ":MaximizerToggle<CR>",
        },
    })
end

return M
