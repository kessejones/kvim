return {
    "sindrets/diffview.nvim",
    lazy = true,
    keys = {
        "<Leader>hd",
        "<Leader>hD",
    },
    cmd = { "DiffviewOpen" },
    config = function()
        require("kvim.core.diffview").init()
    end,
}
