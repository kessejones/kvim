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
            commentStyle = "italic",
            functionStyle = "NONE",
            keywordStyle = "NONE",
            statementStyle = "NONE",
            typeStyle = "NONE",
            variablebuiltinStyle = "italic",
            specialReturn = true,
            specialException = true,
            transparent = false,
            globalStatus = true,
            colors = {},
            overrides = {},
        })

        settings.cmd("colorscheme", "kanagawa")
    end
end

return M
