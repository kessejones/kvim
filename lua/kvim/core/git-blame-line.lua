local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
    require("git-blame-line").setup({
        view = {
            enable_cursor_hold = true,
        },
    })

    local mappings = {
        normal_mode = {
            ["<S-T>"] = "<cmd>:GitBlameLineToggle<CR>",
        },
    }

    keymappings.load(mappings)
end

return M
