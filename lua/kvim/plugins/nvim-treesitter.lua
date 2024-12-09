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
                    forwardLooking = {
                        small = 5,
                        big = 15,
                    },
                    notify = {
                        whenNotFound = true,
                    },
                    keymaps = {
                        useDefaultKeymaps = true,
                        disabledKeymaps = false,
                    },
                })
            end,
        },
    },
    config = function()
        require("kvim.core.treesitter").init()
    end,
}
