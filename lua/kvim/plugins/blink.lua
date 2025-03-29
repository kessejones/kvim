return {
    "saghen/blink.cmp",
    version = "*",
    build = "cargo build --release",
    dependencies = {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        config = function()
            require("kvim.core.luasnip").init()
        end,
    },
    config = function()
        require("kvim.core.cmp.blink").init()
    end,
}
