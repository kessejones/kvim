return {
    "numToStr/Comment.nvim",
    keys = {
        "<Leader>/",
    },
    config = function()
        require("kvim.core.comment").init()
    end,
}
