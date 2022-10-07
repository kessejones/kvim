local plugins = require("kvim.plugins")
local colors = require("kvim.colors")
local plugin_loader = require("kvim.plugin-loader")
local core = require("kvim.core")
local keymappings = require("kvim.keymappings")
local config = require("kvim.config")
local ui = require("kvim.ui")

local M = {}

function M.init()
    config.init()
    keymappings.init()

    plugin_loader.init()
    if not plugin_loader.packer_started then
        print("error on start packer")
        return
    end

    plugin_loader.load(plugins)
    if plugin_loader.packer_bootstrap then
        return
    end

    colors.init()
    core.init()
    ui.init()
end

return M
