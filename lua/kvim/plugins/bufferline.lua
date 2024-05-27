return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    config = function()
        require("kvim.core.bufferline").init()
    end,
}
