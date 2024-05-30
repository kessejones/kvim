local bufferline = require("bufferline")
local nmap = require("kvim.utils.keymap").nmap

local M = {}

function M.init()
    bufferline.setup({
        options = {
            mode = "tabs",
            indicator = { style = "none" },
            always_show_bufferline = true,
            show_close_icon = false,
            show_buffer_close_icons = false,
            show_tab_indicators = false,
        },
        highlights = {
            fill = { bg = "#1a1a24" },
        },
    })

    for i = 1, 9, 1 do
        nmap("<Leader>" .. i, function()
            bufferline.go_to(tostring(i))
        end, { desc = "Go to buffer " .. i })
    end
end

return M
