return {
    "nvim-tree/nvim-tree.lua",
    keys = {
        "<C-g>",
    },
    config = function()
        require("kvim.core.nvimtree").init()
    end,
}
