return {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- manage LSP servers
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("kvim.core.lsp").init()
        require("kvim.core.mason").init()
    end,
}
