local keymappings = require("kvim.keymappings")
local gitsigns = require("gitsigns")

local M = {}

function M.init()
    gitsigns.setup({
        current_line_blame = false,
    })

    keymappings.load({
        normal_mode = {
            ["<Leader>td"] = ":Gitsigns toggle_deleted<CR>",
        },
    })
end

return M
