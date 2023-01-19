local diffview = require("diffview")

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
end

return M
