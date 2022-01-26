local M = {  }

local modules = {
    "kvim.core.nvimtree",
    "kvim.core.startify",
    "kvim.core.commentary",
    "kvim.core.indent-blankline",
    "kvim.core.treesitter",
    "kvim.core.lsp",
    "kvim.core.cmp",
    "kvim.core.ctrlp",
    "kvim.core.git-blame-line",
    "kvim.core.lualine",
    "kvim.core.mix-fugitive",
    "kvim.core.null-ls",
    "kvim.core.gitsigns",
}

function M:init()
    for _, path_module in ipairs(modules) do
        local module = require(path_module)
        module:init()
    end
end

return M
