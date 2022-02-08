local telescope = require("telescope")
local project = require("project_nvim")

local M = {}

function M:init()
    project.setup({
        active = true,
        patterns = { ".git", "Makefile", "package.json", "Cargo.toml", "composer.json" },
        ignore_lsp = {},
        datapath = vim.fn.stdpath("data"),
    })

    telescope.load_extension("projects")
end

return M
