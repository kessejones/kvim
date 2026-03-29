local mason = require("mason")

local M = {}

function M.init()
    vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.stdpath("data") .. "/mason/bin"

    mason.setup({
        ui = {
            border = "rounded",
        },
    })
end

return M
