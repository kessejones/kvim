return {
    "stevearc/oil.nvim",
    keys = {
        "<Leader>tt",
        "<Leader>tg",
    },
    config = function()
        require("kvim.core.oil").init()
    end,
}
