return {
    "LhKipp/nvim-nu",
    enabled = false,
    ft = {
        "nu",
    },
    build = ":TSInstall nu",
    config = function()
        require("nu").setup({})
    end,
}
