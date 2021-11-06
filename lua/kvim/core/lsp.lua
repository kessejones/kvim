local M = {  }
local keymapping = require('kvim.keymappings')

function M:init() 
    local mapping = {
        normal_mode = {
            ["K"] = "<cmd>:LspHover<CR>"
        }
    }
    keymapping:load(mapping)
end

return M
