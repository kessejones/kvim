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
            show_buffer_icons = false,
            truncate_names = false,
            modified_icon = "",
            custom_filter = function(buf_number, _buf_numbers)
                if not vim.bo[buf_number].buflisted then
                    return false
                end

                return true
            end,
            name_formatter = function(buf)
                if buf.name == "[No Name]" and #buf.buffers == 1 then
                    return buf.name
                end

                local result = {}
                for _, bufnr in ipairs(buf.buffers) do
                    if vim.bo[bufnr].buflisted then
                        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")

                        filename = vim.bo[bufnr].modified and filename .. " [+]" or filename
                        table.insert(result, filename)
                    end
                end

                return table.concat(result, " | ")
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
