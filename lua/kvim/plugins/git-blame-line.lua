return {
    "kessejones/git-blame-line.nvim",
    branch = "diffview-integration",
    cmd = "GitBlameLineToggle",
    keys = {
        "<S-t>",
        "<Leader>gt",
    },
    dependencies = {
        "sindrets/diffview.nvim",
    },
    config = function()
        require("kvim.core.git-blame-line").init()
    end,
}
