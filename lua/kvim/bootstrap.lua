local plugins = require("kvim.plugins")
local colors = require("kvim.colors")
local plugin_loader = require("kvim.plugin-loader")
local core = require("kvim.core")
local keymappings = require("kvim.keymappings")
local config = require("kvim.config")

local M = {}

function M.init()
    config.init()
    keymappings.init()

    plugin_loader.init()
    plugin_loader.load(plugins)

    if plugin_loader.packer_is_first_start then
        return
    end

    colors.init()
    core.init()
end

return M
