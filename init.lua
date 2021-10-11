local boostrap = require('kvim.bootstrap')
local core = require'kvim.core'
local config = require'kvim.config'
local keymappings = require('kvim.keymappings')
local plugins = require'kvim.plugins'
local plugin_loader = require'kvim.plugin-loader'

boostrap:init()

plugin_loader:load(plugins)

core.init()
keymappings:init()

