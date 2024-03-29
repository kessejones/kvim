return {
    "brenton-leighton/multiple-cursors.nvim",
    event = "VeryLazy",
    keys = {
        "<C-k>",
        "<C-j>",
        "<Leader>l",
    },
    config = function()
        require("kvim.core.multi-cursor").init()
    end,
}
