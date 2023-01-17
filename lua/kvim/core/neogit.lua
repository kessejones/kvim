local neogit = require("neogit")

local M = {}

function M.init()
    neogit.setup({
        disable_commit_confirmation = true,
        disable_hint = true,
        integrations = {
            diffview = true,
        },
    })
end

return M
