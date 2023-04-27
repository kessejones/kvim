return {
    "neovim/nvim-lspconfig",
    event = { "BufRead" },
    dependencies = {
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
