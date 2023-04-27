local mason = require("mason")

local M = {}

function M.init()
    mason.setup({
        ui = {
            border = "rounded",
        },
    })
end

return M
