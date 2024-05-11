return {
    "neovim/nvim-lspconfig",
    event = { "BufRead" },
    dependencies = {
        {
            "j-hui/fidget.nvim",
            opts = {},
            event = { "BufRead" },
        },
    },
    config = function()
        require("kvim.core.lsp").init()
    end,
}
