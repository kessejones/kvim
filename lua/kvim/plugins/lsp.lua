return {
    "neovim/nvim-lspconfig",
    event = { "BufRead" },
    config = function()
        require("kvim.core.lsp").init()
    end,
}
