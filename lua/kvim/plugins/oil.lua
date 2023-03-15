return {
    "stevearc/oil.nvim",
    keys = {
        "<Leader>t",
    },
    config = function()
        require("kvim.core.oil").init()
    end,
}
