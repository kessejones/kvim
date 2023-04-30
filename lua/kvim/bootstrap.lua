local plugin_manager = require("kvim.plugin-manager")
local keymappings = require("kvim.keymappings")
local config = require("kvim.config")
local ui = require("kvim.ui")

local M = {}

function M.init()
    config.init()
    keymappings.init()

    plugin_manager.init()

    ui.init()
end

return M
