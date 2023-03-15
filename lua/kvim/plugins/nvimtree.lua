return {
    "kyazdani42/nvim-tree.lua",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    keys = {
        "<C-g>",
    },
    config = function()
        require("kvim.core.nvimtree").init()
    end,
}
