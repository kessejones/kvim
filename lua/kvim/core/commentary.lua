local keymappings = require("kvim.keymappings")
local M = {}

function M.init()
    -- NOTE: \x2f is equal to ctrl+/ (hack for macos)
    local ctrl_slash = "\x2f"

    local default_mappings = {
        normal_mode = {
            ["<C-_>"] = ":Commentary<CR>",
            [ctrl_slash] = ":Commentary<CR>",
        },
        visual_mode = {
            ["<C-_>"] = ":Commentary<CR>",
            [ctrl_slash] = ":Commentary<CR>",
        },
    }

    keymappings.load(default_mappings)
end

return M
