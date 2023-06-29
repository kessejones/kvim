return {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
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
