local M = {  }
local settings = require('kvim.config.settings')

function M:init()
    vim.g.tokyonight_style = "night"
    vim.g.tokyonight_enable_italic = true

    local scheme_name = "tokyonight"
    if not vim.fn.has('mac') then
        settings:set("termguicolors", true)
    end

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

return M

