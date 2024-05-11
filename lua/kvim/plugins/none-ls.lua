return {
    "nvimtools/none-ls.nvim",
    event = { "BufRead" },
    config = function()
        require("kvim.core.none-ls").init()
    end,
}
