local settings = require("kvim.config.settings")

local M = {}

function M:init()
    local scheme_name = "kanagawa"

    if not vim.fn.has("macunix") and vim.fn.has("termguicolors") then
        settings:set("termguicolors", true)
    end

    if self:scheme_exists(scheme_name) then
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

        settings:cmd("colorscheme", scheme_name)
    end
end

function M:scheme_exists(scheme)
    local schemes = vim.fn.getcompletion("", "color")
    for _, t in ipairs(schemes) do
        if t == scheme then
            return true
        end
    end
    return false
end

function M:hi(group, colors)
    vim.fn.exe(group, colors)
end

return M
