return {
    "akinsho/bufferline.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
        require("kvim.core.bufferline").init()
    end,
}
