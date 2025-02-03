return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufRead" },
    enabled = false,
    config = function()
        require("kvim.core.indent-blankline").init()
    end,
}
