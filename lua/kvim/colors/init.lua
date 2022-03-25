local utils = require("utils")
local settings = require("kvim.config.settings")

local M = {}

function M.init()
    local scheme_name = "kanagawa"

    if not vim.fn.has("macunix") and vim.fn.has("termguicolors") then
        settings.set("termguicolors", true)
    end

    if utils.contains(vim.fn.getcompletion("", "color"), scheme_name) then
        require("kanagawa").setup({
            undercurl = true,
            commentstyle = "italic",
            functionstyle = "italic",
            keywordstyle = "italic",
            statementstyle = "italic",
            typestyle = "none",
            variablebuiltinStyle = "italic",
            specialReturn = true,
            specialException = true,
            transparent = false,
            colors = {},
            overrides = {},
        })

        settings.cmd("colorscheme", scheme_name)
    end
end

return M
