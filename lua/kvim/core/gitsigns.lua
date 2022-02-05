local keymappings = require("kvim.keymappings")

local M = {}

function M:init()
    require("gitsigns").setup({
        current_line_blame = false,
    })

    keymappings:load({
        normal_mode = {
            ["<Leader>td"] = ":Gitsigns toggle_deleted<CR>",
        },
    })
end

return M
