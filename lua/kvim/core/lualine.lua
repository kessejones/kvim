local lualine = require("lualine")
local colors = require("catppuccin.palettes").get_palette("mocha")

local M = {}

local filename = {
    "filename",
    file_status = true,
    path = 0,
    color = { bg = colors.mantle, fg = colors.text, gui = "italic" },
}

local diff = {
    "diff",
    color = { bg = colors.mantle, fg = colors.bg, gui = "bold" },
    symbols = { added = " ", modified = " ", removed = " " },

    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.yellow },
        removed = { fg = colors.red },
    },
}

local diagnostics = {
    "diagnostics",
    sources = { "nvim_lsp", "nvim_workspace_diagnostic" },
    color = { bg = colors.mantle, fg = colors.text, gui = "bold" },
}

local filetype = {
    "filetype",
    color = { bg = colors.mantle, fg = colors.text, gui = "bold" },
}

local location = {
    "location",
    color = { bg = colors.blue, fg = colors.base, gui = "italic" },
}

local searchcount = {
    "searchcount",
    color = { bg = colors.red, fg = colors.base, gui = "bold" },
}

local selectioncount = {
    "selectioncount",
    color = { bg = colors.mauve, fg = colors.base, gui = "bold" },
}

function M.init()
    lualine.setup({
        options = {
            globalstatus = true,
            icons_enabled = true,
            theme = "auto",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                "alpha",
            },
            always_divide_middle = true,
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", diff },
            lualine_c = { filename },
            lualine_x = { searchcount, selectioncount },
            lualine_y = { diagnostics },
            lualine_z = { filetype, location },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { filename },
            lualine_x = { location },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
    })
end

return M
