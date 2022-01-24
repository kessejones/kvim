local M = { }
local plugins = require('kvim.plugins')
local colors = require('kvim.colors')

function M:init()
    require'kvim.config':init()

    local loader = require'kvim.plugin-loader'
    loader:init()
    loader:load(plugins)

    colors:init()
end

return M
