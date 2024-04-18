return {
    "brenton-leighton/multiple-cursors.nvim",
    event = "VeryLazy",
    keys = {
        "<C-S-K>",
        "<C-S-J>",
        "<C-s>l",
        "<C-s>a",
        "<C-s>n",
    },
    config = function()
        require("kvim.core.multi-cursor").init()
    end,
}
