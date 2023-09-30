local M = {}

function M.init()
    require("catppuccin").setup({
        flavour = "mocha",
        custom_highlights = function(colors)
            return {
                FloatBorder = { fg = colors.blue, bg = colors.base },
                HarpoonBorder = { fg = colors.blue, bg = colors.base },
                TermBorder = { link = "FloatBorder" },
                NormalFloat = { fg = colors.text, bg = colors.base },
                TelescopeBorder = { link = "FloatBorder" },
                IndentBlanklineContextChar = { fg = colors.surface2 },
                WinSeparator = { fg = colors.blue },
                Breakpoint = { fg = colors.red },
                IncSearch = { bg = colors.lavender },
            }
        end,
    })

    vim.cmd.colorscheme("catppuccin")
end

return M
