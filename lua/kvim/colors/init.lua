local M = {}

function M.init()
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
            TermBorder = { link = "FloatBorder" },
            NormalFloat = { fg = colors.text, bg = colors.base },
            TelescopeBorder = { link = "FloatBorder" },
            IndentBlanklineContextChar = { fg = colors.surface2 },
            WinSeparator = { fg = colors.blue },
            Breakpoint = { fg = colors.red },
        },
    })

    vim.cmd.colorscheme("catppuccin")
end

return M
