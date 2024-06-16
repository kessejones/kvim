return {
    "folke/flash.nvim",
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
