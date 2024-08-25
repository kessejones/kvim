local bufferline = require("bufferline")
local nmap = require("kvim.utils.keymap").nmap

local M = {}

function M.init()
    bufferline.setup({
        options = {
            mode = "tabs",
            style_preset = bufferline.style_preset.no_italic,
            indicator = { style = "none" },
            always_show_bufferline = true,
            show_close_icon = false,
            show_buffer_close_icons = false,
            show_tab_indicators = false,
            show_buffer_icons = true,
            truncate_names = false,
            modified_icon = "",
            custom_filter = function(buf_number, _buf_numbers)
                return vim.bo[buf_number].buflisted
            end,
            name_formatter = function(buf)
                local tbl = {}
                table.insert(tbl, buf.name)

                if #buf.buffers > 1 then
                    table.insert(tbl, string.format("(%d)", #buf.buffers))
                end
                -- NOTE: custom modification indicator for all buffers in this tabpage
                for _, bufnr in ipairs(buf.buffers) do
                    if vim.bo[bufnr].modified then
                        table.insert(tbl, "[+]")
                        break
                    end
                end

                return table.concat(tbl, " ")
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
