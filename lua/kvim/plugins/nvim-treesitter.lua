return {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.0",
    lazy = true,
    build = ":TSUpdate",
    cmd = { "TSUpdate", "TSUpdateSync" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        require("kvim.core.treesitter").init()
    end,
}
