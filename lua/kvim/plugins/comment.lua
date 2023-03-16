return {
    "numToStr/Comment.nvim",
    keys = {
        { "<Leader>/", mode = { "n", "v" } },
    },
    config = function()
        require("kvim.core.comment").init()
    end,
}
