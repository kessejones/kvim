local neogit = require("neogit")
local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
    neogit.setup({
        disable_commit_confirmation = true,
        disable_hint = true,
        integrations = {
            diffview = true,
        },
    })
    keymappings.load({
        normal_mode = {
            ["<Leader>gg"] = function()
                require("neogit").open({})
            end,
        },
    })
end

return M
