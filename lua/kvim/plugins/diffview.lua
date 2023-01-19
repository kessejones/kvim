return {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    keys = {
        {
            "<Leader>gv",
            function()
                require("diffview").open()
            end,
        },
        {
            "<Leader>gf",
            function()
                require("diffview").file_history()
            end,
        },
    },
    config = function()
        require("kvim.core.diffview").init()
    end,
}
