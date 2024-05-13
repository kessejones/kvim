local diffview = require("diffview")
local actions = require("diffview.actions")

local nmap = require("kvim.utils.keymap").nmap

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

    nmap("<Leader>hd", function()
        require("diffview").file_history()
    end, { desc = "Open file history" })

    nmap("<Leader>hD", function()
        require("diffview").open()
    end, { desc = "Open Diffview" })
end

return M
