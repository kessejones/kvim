local lualine = require("lualine")
local term = require("term")

local M = {}

function M.init()
    local term_ext = {
        sections = {
            lualine_a = { "mode" },
            lualine_b = {
                function()
                    local status = term.status()
                    return status.current .. "/" .. status.count
                end,
            },
        },
        filetypes = { "Term" },
    }

    lualine.setup({
        options = {
            globalstatus = true,
            icons_enabled = true,
            theme = "auto",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {},
            always_divide_middle = true,
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch" },
            lualine_c = { { "filename", file_status = false, path = 0 } },
            lualine_x = { { "diagnostics", source = { "nvim_lsp" } }, "encoding", "filetype" },
            lualine_y = { "progress" },
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
        extensions = {
            term_ext,
        },
    })
end

return M
