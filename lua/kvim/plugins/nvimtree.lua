return {
    "kyazdani42/nvim-tree.lua",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    keys = {
        {
            "<C-g>",
            function()
                require("nvim-tree").toggle()
            end,
        },
    },
    config = function()
        require("kvim.core.nvimtree").init()
    end,
}
