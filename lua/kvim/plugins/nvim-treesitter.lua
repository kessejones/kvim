return {
    "nvim-treesitter/nvim-treesitter",
    event = { "VeryLazy" },
    build = ":TSUpdate",
    cmd = { "TSUpdate", "TSUpdateSync", "TSInstall" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        require("kvim.core.treesitter").init()
    end,
}
