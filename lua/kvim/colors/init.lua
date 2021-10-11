local M = {  }
local settings = require('kvim.config.settings')

local cmd = vim.cmd
local has = vim.fn.has

function M:init()
    vim.g.tokyonight_style = "night"
    vim.g.tokyonight_enable_italic = true

    if not has('mac') then
        settings:set("termguicolors", true)
    end

    settings:cmd("colorscheme", "tokyonight")
end

return M

