local M = {  }
local settings = require('kvim.config.settings')

function M:init()
    vim.g.tokyonight_style = "night"
    vim.g.tokyonight_enable_italic = true

    if not vim.fn.has('mac') then
        settings:set("termguicolors", true)
    end

    settings:cmd("colorscheme", "tokyonight")
end

return M

