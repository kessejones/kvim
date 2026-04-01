local M = {}

function M.init()
    local filetypes = {
        "c",
        "cpp",
        "odin",
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
    }

    local treesitter = require("nvim-treesitter")
    treesitter.install(filetypes)

    local filetypes_installed = treesitter.get_installed()
    vim.api.nvim_create_autocmd("FileType", {
        pattern = filetypes_installed,
        callback = function()
            vim.treesitter.start()

            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.wo.foldmethod = "expr"

            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
    })
end

return M
