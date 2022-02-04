local keymappings = require('kvim.keymappings')
local M = {  }

function M:init()
    local default_mappings = {
        normal_mode = {
            ["<C-_>"] = ":Commentary<CR>",
            ["<Space>;"] = ":Commentary<CR>",
        },
        visual_mode = {
            ["<C-_>"] = ":Commentary<CR>",
            ["<Space>;"] = ":Commentary<CR>",
        }
    }

    keymappings:load(default_mappings)
end

return M
