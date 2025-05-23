return {
    "saghen/blink.cmp",
    lazy = false,
    version = "*",
    -- build = 'nix run .#build-plugin',
    build = "cargo build --release",
    dependencies = {
        "fang2hou/blink-copilot",
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
            config = function()
                require("kvim.core.luasnip").init()
            end,
        },
    },
    config = function()
        require("kvim.core.cmp.blink").init()
    end,
}
