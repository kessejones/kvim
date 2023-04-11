return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        "<C-g>",
    },
    config = function()
        require("kvim.core.nvimtree").init()
    end,
}
