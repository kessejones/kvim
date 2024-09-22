return {
    "nvim-treesitter/nvim-treesitter",
    event = { "VeryLazy" },
    build = ":TSUpdate",
    cmd = { "TSUpdate", "TSUpdateSync", "TSInstall" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        {
            "chrisgrieser/nvim-various-textobjs",
            config = function()
                require("various-textobjs").setup({
                    lookForwardSmall = 5,
                    lookForwardBig = 15,
                    useDefaultKeymaps = true,
                    disabledKeymaps = {},
                    notifyNotFound = true,
                })
            end,
        },
    },
    config = function()
        require("kvim.core.treesitter").init()
    end,
}
