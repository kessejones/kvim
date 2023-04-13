return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "tiagovla/scope.nvim",
        "moll/vim-bbye",
    },
    config = function()
        require("kvim.core.bufferline").init()
        require("scope").setup()
    end,
}
