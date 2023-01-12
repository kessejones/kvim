return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",

        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind-nvim",
        "L3MON4D3/LuaSnip",
    },
    config = function()
        require("kvim.core.cmp").init()
    end,
}