return {
    "folke/flash.nvim",
    event = {
        "VeryLazy",
    },
    keys = {
        "f",
        "F",
        "ss",
        "se",
        "sa",
        "st",
        "sz",
    },
    config = function()
        require("kvim.core.flash").init()
    end,
}
