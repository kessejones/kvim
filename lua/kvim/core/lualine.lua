local lualine = require("lualine")

local M = {}

function M.init()
    lualine.setup({
        options = {
            globalstatus = true,
            icons_enabled = true,
            theme = "auto",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                "alpha",
            },
            always_divide_middle = true,
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff" },
            lualine_c = { { "filename", file_status = false, path = 0 } },
            lualine_x = { { "diagnostics", source = { "nvim_lsp" } }, "encoding", "filetype" },
            lualine_y = { "progress", "searchcount" },
            lualine_z = { "location" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { { "filename", file_status = true, path = 1 } },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
    })
end

return M
