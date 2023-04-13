return {
    "neovim/nvim-lspconfig",
    event = { "BufRead" },
    dependencies = {
        -- manage LSP servers
        { "williamboman/mason.nvim", enabled = not require("kvim.utils").is_linux() },
        {
            "williamboman/mason-lspconfig.nvim",
            enabled = not require("kvim.utils").is_linux(),
            config = function()
                require("kvim.core.mason").init()
            end,
        },
        {
            "jose-elias-alvarez/null-ls.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
            config = function()
                require("kvim.core.null-ls").init()
            end,
        },
    },
    config = function()
        require("kvim.core.lsp").init()
    end,
}
