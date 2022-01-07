local M = {  }

local modules = {
    "kvim.core.nvimtree",
    "kvim.core.startify",
    "kvim.core.identline",
    "kvim.core.commentary",
    "kvim.core.treesitter",
    "kvim.core.prittier",
    "kvim.core.lsp",
    "kvim.core.ctrlp",
    "kvim.core.phpcsfixer",
    "kvim.core.git-blame-line",
    "kvim.core.lualine",
}

function M:init()
    for _, path_module in ipairs(modules) do
        local module = require(path_module)
        module:init()
    end
end

return M
