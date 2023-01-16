return {
    { "mattn/emmet-vim", ft = { "html" } },

    -- utils
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

    -- find/replace
    {
        "nvim-pack/nvim-spectre",
        lazy = true,
        keys = {
            { ",s", "<cmd>lua require('spectre').open()<cr>", desc = "Spectre" },
            { ",f", "<cmd>lua require('spectre').open_file_search()<cr>", desc = "Spectre file search" },
        },
    },

    -- .editorconfig
    { "gpanders/editorconfig.nvim" }, -- TODO: remove this when update to nvim 0.9

    -- database
    {
        "kristijanhusak/vim-dadbod-ui",
        cmd = "DBUIToggle",
        keys = {
            {
                "<Leader>u",
                ":DBUIToggle<CR>",
                desc = "Toggle Dadbod UI",
            },
        },
        dependencies = {
            "tpope/vim-dadbod",
            "kristijanhusak/vim-dadbod-completion",
        },
    },

    -- rest api
    {
        "NTBBloodbath/rest.nvim",
        ft = { "http" },
        keys = {
            {
                "<Leader>n",
                "<cmd>lua require('rest-nvim').run()<CR>",
                desc = "Rest run",
            },
        },
    },
}
