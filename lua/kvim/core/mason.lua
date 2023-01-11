local mason = require("mason")
local mason_lsp = require("mason-lspconfig")

local M = {}

function M.init()
    mason.setup({
        ui = {
            border = "rounded",
        },
    })
    mason_lsp.setup({
        ensure_installed = {
            "sumneko_lua",
            "rust_analyzer",
            "phpactor",
            "html",
            "tsserver",
            "cssls",
            "yamlls",
            "dockerls",
            "clangd",
            "gopls",
            "pyright",
        },
    })
end

return M
