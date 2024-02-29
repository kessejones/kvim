local diffview = require("diffview")
local actions = require("diffview.actions")

local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
    diffview.setup({
        keymaps = {
            view = {
                ["q"] = function()
                    diffview.close()
                end,
                ["<C-g>"] = actions.toggle_files,
                ["[f"] = actions.prev_conflict,
                ["]f"] = actions.next_conflict,
            },
            file_panel = {
                ["q"] = function()
                    diffview.close()
                end,
                ["<C-g>"] = actions.toggle_files,
            },
            file_history_panel = {
                ["q"] = function()
                    diffview.close()
                end,
                ["<C-g>"] = actions.toggle_files,
            },
        },
        view = {
            merge_tool = {
                layout = "diff3_mixed",
            },
        },
    })

    keymappings.load({
        normal_mode = {
            ["<Leader>hd"] = function()
                require("diffview").file_history()
            end,
            ["<Leader>hD"] = function()
                require("diffview").open()
            end,
        },
    })
end

return M
