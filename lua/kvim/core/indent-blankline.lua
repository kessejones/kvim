local indent_blankline = require("ibl")

local M = {}

function M.init()
    indent_blankline.setup({
        scope = {
            enabled = true,
            show_start = false,
            show_end = false,
            char = "▎",
            include = {
                node_type = {
                    ["*"] = { "*" },
                },
            },
        },
        exclude = {
            filetypes = {
                "NeogitStatus",
                "NvimTree",
                "floaterm",
                "packer",
                "Term",
                "KVimTerm",
                "lspinfo",
                "checkhealth",
                "help",
                "man",
                "gitcommit",
                "TelescopePrompt",
                "TelescopeResults",
                "",
            },
        },
    })
end

return M
