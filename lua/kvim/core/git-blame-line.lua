local keymappings = require("kvim.keymappings")
local git_blame_line = require("git-blame-line")

local M = {}

function M.init()
    git_blame_line.setup({
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
