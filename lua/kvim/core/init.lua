local M = {}

local modules = {
    "diffview",
    "nvim-autopairs",
    "cmp",
    "comment",
    "git-blame-line",
    "neogit",
    "gitsigns",
    "indent-blankline",
    "mason",
    "lsp",
    "lualine",
    "maximizer",
    "mix",
    "null-ls",
    "nvimtree",
    "project",
    "startify",
    "surround",
    "telescope",
    "treesitter",
    "multi-cursor",
    "spectre",
    "bufferline",
    "vim-dadbod",
    "dap",
    "term",
    "rest",
    "ccc",
}

function M.init()
    local module_base = "kvim.core."
    for _, path_module in ipairs(modules) do
        local module = require(module_base .. path_module)
        module.init()
    end
end

return M
