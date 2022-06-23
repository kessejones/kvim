local neogit = require("neogit")
local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
    neogit.setup({
        disable_commit_confirmation = true,
        integrations = {
            diffview = true,
        },
    })

    keymappings.load({
        normal_mode = {
            ["<Leader>gg"] = function()
                neogit.open({})
            end,
        },
    })
end

return M
