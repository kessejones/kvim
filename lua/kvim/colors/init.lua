local utils = require("utils")
local settings = require("kvim.config.settings")

local M = {}

function M.init()
    if not utils.is_macos() and utils.has_termguicolors() then
        settings.set("termguicolors", true)
    end

    vim.g.catppuccin_flavour = "macchiato"
    local colors = require("catppuccin.palettes").get_palette(vim.g.catppuccin_flavour)

    require("catppuccin").setup({
        styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = { "italic" },
            types = { "italic" },
            keywords = { "italic" },
        },
        custom_highlights = {
            FloatBorder = { fg = colors.text, bg = colors.base },
            NormalFloat = { fg = colors.text, bg = colors.base },
            TelescopeBorder = { link = "FloatBorder" },
            IndentBlanklineContextChar = { fg = colors.surface2 },
        },
    })

    vim.api.nvim_command("colorscheme catppuccin")
end

return M
