return {
    "nvim-lualine/lualine.nvim",
    event = { "VeryLazy" },
    config = function()
        require("kvim.core.lualine").init()
    end,
}
