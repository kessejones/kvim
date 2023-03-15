return {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    keys = {
        "<Leader>gv",
        "<Leader>gf",
    },
    config = function()
        require("kvim.core.diffview").init()
    end,
}
