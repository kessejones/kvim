return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
        -- require("kvim.core.indent-blankline").init()
        require("kvim.core.lualine").init()
    end,
}
