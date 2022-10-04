local utils = require("utils")
local settings = require("kvim.config.settings")

local M = {}

function M.init()
    if not utils.is_macos() and utils.has_termguicolors() then
        settings.set("termguicolors", true)
    end

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

    vim.api.nvim_set_hl(0, "NormalFloat", {
        background = "#1F1F28",
    })

    vim.api.nvim_set_hl(0, "FloatBorder", {
        background = "#1F1F28",
    })
end

return M
