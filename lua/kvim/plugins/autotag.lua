return {
    "windwp/nvim-ts-autotag",
    ft = {
        "xml",
        "html",
        "jsx",
        "tsx",
        "vue",
        "markdown",
    },
    config = function()
        require("nvim-ts-autotag").setup()
    end,
}
