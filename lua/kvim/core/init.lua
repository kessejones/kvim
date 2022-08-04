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
    "mix",
    "null-ls",
    "nvimtree",
    "project",
    "startify",
    "surround",
    "telescope",
    "floaterm",
    "treesitter",
    "multi-cursor",
    "spectre",
    "bufferline",
    "vim-dadbod",
    "dap",
}

function M.init()
    local module_base = "kvim.core."
    for _, path_module in ipairs(modules) do
        local module = require(module_base .. path_module)
        module.init()
    end
end

return M
