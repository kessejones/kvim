return {
    {
        "szw/vim-maximizer",
        cmd = "Maximizer",
        keys = {
            { "<Leader>m", ":MaximizerToggle<CR>", desc = "Toggle maximizer" },
        },
    },
    { "kylechui/nvim-surround" },
    {
        "windwp/nvim-autopairs",
        opts = {},
    },
    { "moll/vim-bbye" },
    { "gpanders/editorconfig.nvim" }, -- TODO: remove this when update to nvim 0.9
}
