return {
    "kessejones/git-blame-line.nvim",
    event = { "InsertEnter" },
    cmd = "GitBlameLineToggle",
    config = function()
        require("kvim.core.git-blame-line").init()
    end,
}
