return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufRead" },
    config = function()
        require("kvim.core.indent-blankline").init()
    end,
}
