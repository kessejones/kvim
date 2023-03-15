local diffview = require("diffview")
local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
    diffview.setup({
        keymaps = {
            view = {
                ["q"] = diffview.close,
            },
            file_panel = {
                ["q"] = diffview.close,
            },
            file_history_panel = {
                ["q"] = diffview.close,
            },
        },
    })

    keymappings.load({
        normal_mode = {
            ["<Leader>gv"] = function()
                require("diffview").open()
            end,
        },
        {
            ["<Leader>gf"] = function()
                require("diffview").file_history()
            end,
        },
    })
end

return M
