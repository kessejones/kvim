local boostrap = require('kvim.bootstrap')
local core = require'kvim.core'
local keymappings = require('kvim.keymappings')
local colors = require'kvim.colors'

boostrap:init()

core.init()
keymappings:init()
