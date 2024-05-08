local ccc = require("ccc")
local keymappings = require("kvim.utils.keymap")

local M = {}

function M.init()
    ccc.setup({})

    keymappings.load({
        normal_mode = {
            ["<Leader>c"] = ":CccPick<CR>",
        },
    })
end

return M
