local M = {}

local modules = {
    "kvim.core.cmp",
    "kvim.core.commentary",
    "kvim.core.git-blame-line",
    "kvim.core.git-fugitive",
    "kvim.core.gitsigns",
    "kvim.core.indent-blankline",
    "kvim.core.lsp",
    "kvim.core.lualine",
    "kvim.core.maximizer",
    "kvim.core.mix-fugitive",
    "kvim.core.null-ls",
    "kvim.core.nvimtree",
    "kvim.core.project",
    "kvim.core.startify",
    "kvim.core.telescope",
    "kvim.core.toggleterm",
    "kvim.core.treesitter",
    "kvim.core.barbar",
}

function M:init()
    for _, path_module in ipairs(modules) do
        local module = require(path_module)
        module:init()
    end
end

return M
