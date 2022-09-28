local utils = require("utils")
local settings = require("kvim.config.settings")

local M = {}

function M.init()
    if not vim.fn.has("macunix") and vim.fn.has("termguicolors") then
        settings.set("termguicolors", true)
    end

    if utils.contains(vim.fn.getcompletion("", "color"), "kanagawa") then
        require("kanagawa").setup({
            undercurl = true,
            commentStyle = { italic = true },
            variablebuiltinStyle = { italic = true },
            specialReturn = true,
            specialException = true,
            transparent = false,
            globalStatus = true,
            colors = {},
            overrides = {},
        })

        settings.cmd("colorscheme", "kanagawa")
    end

    vim.api.nvim_set_hl(0, "NormalFloat", {
        background = "#1F1F28",
    })

    vim.api.nvim_set_hl(0, "FloatBorder", {
        background = "#1F1F28",
        foreground = "#54546D",
    })
end

return M
