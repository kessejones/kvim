return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "tiagovla/scope.nvim",
    },
    config = function()
        require("kvim.core.bufferline").init()
        require("scope").setup()
    end,
}
