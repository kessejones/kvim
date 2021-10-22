local M = {  }
local settings = require('kvim.config.settings')

function M:init()
    local scheme_name = "onedark"
    settings:set("termguicolors", true)
    vim.g.onedark_terminal_italics = 2
    settings:cmd("colorscheme", scheme_name)
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

function M:hi(group, colors)
    vim.fn.exe(group, colors)
end

return M

