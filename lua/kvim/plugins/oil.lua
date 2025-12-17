return {
    "stevearc/oil.nvim",
    keys = {
        "<Leader>tt",
        "<Leader>tg",
        "<Leader>tr",
    },
    config = function()
        require("kvim.core.oil").init()
    end,
}
