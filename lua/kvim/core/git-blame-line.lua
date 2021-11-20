local keymappings = require('kvim.keymappings')

local M = { }

function M:init()
    require'git-blame-line'.setup()

    local mappings = {
        normal_mode = {
            ["<S-T>"] = "<cmd>:GitBlameLineToggle<CR>"
        }
    }
    
    keymappings:load(mappings)
end

return M
