local bufferline = require("bufferline")
local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
    bufferline.setup({
        options = {
            indicator = {
                style = "",
            },
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
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
            fill = {
                bg = "#1a1a24",
            },
        },
    })

    keymappings.load({
        normal_mode = {
            ["<Leader>1"] = function()
                bufferline.go_to(1)
            end,
            ["<Leader>2"] = function()
                bufferline.go_to(2)
            end,
            ["<Leader>3"] = function()
                bufferline.go_to(3)
            end,
            ["<Leader>4"] = function()
                bufferline.go_to(4)
            end,
            ["<Leader>5"] = function()
                bufferline.go_to(5)
            end,
            ["<Leader>6"] = function()
                bufferline.go_to(6)
            end,
            ["<Leader>7"] = function()
                bufferline.go_to(7)
            end,
            ["<Leader>8"] = function()
                bufferline.go_to(8)
            end,
            ["<Leader>9"] = function()
                bufferline.go_to(9)
            end,
            ["gn"] = function()
                bufferline.move(1)
            end,
            ["gp"] = function()
                bufferline.move(-1)
            end,
        },
    })
end

return M
