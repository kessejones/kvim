-- local plugins = require("kvim.plugins")
local colors = require("kvim.colors")
local plugin_manager = require("kvim.plugin-manager")
-- local core = require("kvim.core")
local keymappings = require("kvim.keymappings")
local config = require("kvim.config")
local ui = require("kvim.ui")

local M = {}

function M.init()
    config.init()
    keymappings.init()

    plugin_manager.init()
    -- plugin_manager.load(plugins)

    colors.init()
    -- core.init()
    ui.init()
end

return M
