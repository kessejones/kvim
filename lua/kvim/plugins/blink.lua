return {
    "saghen/blink.cmp",
    lazy = false,
    version = "*",
    build = (function()
        if vim.fn.executable("nixos-version") then
            return "nix run .#build-plugin"
        end
        return "cargo build --release"
    end)(),
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
