return {
    "kessejones/git-blame-line.nvim",
    branch = "diffview-integration",
    cmd = "GitBlameLineToggle",
    keys = {
        {
            "<S-t>",
            function()
                require("git-blame-line").toggle()
            end,
        },
        {
            "<Leader>gt",
            function()
                require("git-blame-line").open_diffview()
            end,
        },
    },
    dependencies = {
        "sindrets/diffview.nvim",
    },
    config = function()
        require("kvim.core.git-blame-line").init()
    end,
}
