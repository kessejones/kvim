local utils = require("utils")
local settings = require("kvim.config.settings")

local M = {}

function M.init()
    if not utils.is_macos() and utils.has_termguicolors() then
        settings.set("termguicolors", true)
    end

    local flavour = "mocha"
    local colors = require("catppuccin.palettes").get_palette(flavour)

    require("catppuccin").setup({
        flavour = flavour,
        styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = { "italic" },
            types = { "italic" },
            keywords = { "italic" },
        },
        custom_highlights = {
            FloatBorder = { fg = colors.blue, bg = colors.base },
            NormalFloat = { fg = colors.text, bg = colors.base },
            TelescopeBorder = { link = "FloatBorder" },
            IndentBlanklineContextChar = { fg = colors.surface2 },
        },
    })

    vim.api.nvim_command("colorscheme catppuccin")
end

return M
