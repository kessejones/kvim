return {

    "brenton-leighton/multiple-cursors.nvim",
    event = "VeryLazy",
    keys = {
        "<C-S-K>",
        "<C-S-J>",
        "<C-n>l",
        "<C-n>a",
        "<C-n>n",
    },
    config = function()
        require("kvim.core.multi-cursor").init()
    end,
}
