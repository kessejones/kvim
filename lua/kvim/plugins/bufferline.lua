return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "tiagovla/scope.nvim",
    },
    config = function()
        require("kvim.core.bufferline").init()
        require("scope").setup()
    end,
}
