return {
    "jellydn/hurl.nvim",
    ft = { "hurl" },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("kvim.core.hurl").init()
    end,
}
