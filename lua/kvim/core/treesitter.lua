local treesitter = require("nvim-treesitter.configs")
local M = {}

function M.init()
    treesitter.setup({
        ensure_installed = {
            "c",
            "cpp",
            "lua",
            "rust",
            "php",
            "typescript",
            "javascript",
            "tsx",
            "http",
            "html",
            "css",
            "markdown",
            "fish",
            "dockerfile",
            "json",
            "yaml",
            "go",
            "sql",
        },
        auto_install = true,
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        rainbow = {
            enable = true,
        },
    })
end

return M
