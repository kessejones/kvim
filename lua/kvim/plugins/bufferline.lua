return {
    "akinsho/bufferline.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", "tiagovla/scope.nvim" },
    config = function()
        require("kvim.core.bufferline").init()
        require("scope").setup()
    end,
}
