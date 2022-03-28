local treesitter = require("nvim-treesitter.configs")
local M = {}

function M.init()
    treesitter.setup({
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        rainbow = {
            enable = true,
        },
    })
end

return M
