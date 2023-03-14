return {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- manage LSP servers
        { "williamboman/mason.nvim", enabled = not require('kvim.utils').is_linux() },
        {
            "williamboman/mason-lspconfig.nvim",
            enabled = not require('kvim.utils').is_linux(),
            config = function()
                require('kvim.core.mason').init()
            end
        },
    },
    config = function()
        require("kvim.core.lsp").init()
    end,
}
