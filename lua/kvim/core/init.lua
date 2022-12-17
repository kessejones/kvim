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
        local ok, module = pcall(require, module_base .. path_module)
        if ok then
            xpcall(module.init, function(err)
                vim.notify("Could not initialize core module " .. path_module .. ". Error: " .. err)
            end)
        else
            vim.notify("Could not load core module " .. path_module)
        end
    end
end

return M
