return {
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        enabled = false,
        dependencies = {
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "SergioRibera/cmp-dotenv",
            {
                "zbirenbaum/copilot-cmp",
                config = function()
                    require("copilot_cmp").setup()
                end,
            },
            "saadparwaiz1/cmp_luasnip",
            {
                "L3MON4D3/LuaSnip",
                build = "make install_jsregexp",
                config = function()
                    require("kvim.core.luasnip").init()
                end,
            },
            "onsails/lspkind-nvim",
        },
        config = function()
            require("kvim.core.cmp").init()
        end,
    },
    {
        "saghen/blink.cmp",
        version = "v0.*",
        dependencies = {
            "L3MON4D3/LuaSnip",
            build = "make install_jsregexp",
            config = function()
                require("kvim.core.luasnip").init()
            end,
        },
        config = function()
            require("kvim.core.cmp.blink").init()
        end,
    },
}
