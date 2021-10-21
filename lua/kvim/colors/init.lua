local M = {  }
local settings = require('kvim.config.settings')

function M:init()
    local scheme_name = "NeoSolarized"
    if M:scheme_exists(scheme_name) then 
        settings:set("termguicolors", true)
        settings:cmd("colorscheme", scheme_name)
    end
end

function M:scheme_exists(scheme)
    local schemes = vim.fn.getcompletion('', 'color') 
    for _, t in ipairs(schemes) do
        if t == scheme then
            return true
        end
    end
    return false
end

return M

