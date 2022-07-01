local M = {}

local modules = {
    "nvim-autopairs",
    "cmp",
    "comment",
    "git-blame-line",
    "neogit",
    "gitsigns",
    "indent-blankline",
    "lsp",
    "lualine",
    "maximizer",
    "mix-fugitive",
    "null-ls",
    "nvimtree",
    "project",
    "startify",
    "telescope",
    "floaterm",
    "treesitter",
    "multi-cursor",
    "spectre",
    "bufferline",
}

function M.init()
    local module_base = "kvim.core."
    for _, path_module in ipairs(modules) do
        local module = require(module_base .. path_module)
        module.init()
    end
end

return M
