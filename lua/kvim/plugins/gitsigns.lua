return {
    "lewis6991/gitsigns.nvim",
    event = { "BufRead" },
    config = function()
        require("kvim.core.gitsigns").init()
    end,
}
