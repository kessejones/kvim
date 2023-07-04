return {
    "neovim/nvim-lspconfig",
    event = { "BufRead" },
    dependencies = {
        {
            "jose-elias-alvarez/null-ls.nvim",
            config = function()
                require("kvim.core.null-ls").init()
            end,
        },
        {
            "j-hui/fidget.nvim",
            branch = "legacy",
            opts = {},
            event = { "BufRead" },
        },
    },
    config = function()
        require("kvim.core.lsp").init()
    end,
}
