local bufferline = require("bufferline")
local nmap = require("kvim.utils.keymap").nmap

local M = {}

function M.init()
    bufferline.setup({
        options = {
            indicator = { style = "none" },
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(count, level, _diagnostics_dict, _context)
                local icon = level:match("error") and " " or " "
                return " " .. icon .. count
            end,
            show_close_icon = false,
            show_buffer_close_icons = false,
            show_tab_indicators = true,
            enforce_regular_tabs = false,
            sort_by = function(buff_a, buff_b)
                return buff_a.id < buff_b.id
            end,
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
