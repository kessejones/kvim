local plugins = require('kvim.plugins')
local colors = require('kvim.colors')
local plugin_loader = require'kvim.plugin-loader'
local core = require'kvim.core'
local keymappings = require('kvim.keymappings')
local config = require('kvim.config')

local M = { }

function M.init()
    config:init()

    plugin_loader:init()
    plugin_loader:load(plugins)

    core:init()
    keymappings:init()
    colors:init()
end

return M
