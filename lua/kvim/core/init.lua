local M = {}

local modules = {
    "cmp",
    "commentary",
    "git-blame-line",
    "git-fugitive",
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
    "toggleterm",
    "treesitter",
    "multi-cursor",
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
