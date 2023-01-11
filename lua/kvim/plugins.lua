return {
    -- coloscheme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        module = true,
    },

    -- custom editor
    { "goolord/alpha-nvim" },
    { "lukas-reineke/indent-blankline.nvim" },
    { "uga-rosa/ccc.nvim" },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "kyazdani42/nvim-web-devicons" },
    },

    -- elixir/mi
    {
        "brendalf/mix.nvim",
        lazy = true,
        ft = { "ex", "exs" },
        dependencies = {
            { "elixir-editors/vim-elixir", lazy = true, ft = { "ex", "exs" } },
        },
    },

    -- completion/lsp
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- manage LSP servers
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",

            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind-nvim",
            "L3MON4D3/LuaSnip",
        },
    },

    -- file tree
    {
        "kyazdani42/nvim-tree.lua",
        dependencies = { "kyazdani42/nvim-web-devicons" },
    },

    -- formatting/syntax
    { "windwp/nvim-autopairs" },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    { "numToStr/Comment.nvim" },
    { "mattn/emmet-vim", lazy = true, ft = { "html" } },

    -- git integration
    { "lewis6991/gitsigns.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    { "sindrets/diffview.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    { "TimUntersberger/neogit" },
    { "kessejones/git-blame-line.nvim" },

    -- utils
    { "szw/vim-maximizer" },
    { "kylechui/nvim-surround" },

    -- cursors
    { "mg979/vim-visual-multi" },

    -- terminal
    { "kessejones/term.nvim" },

    -- finder
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "ahmedkhalf/project.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
    },

    -- buffers/windows and tabs
    { "akinsho/bufferline.nvim", dependencies = "kyazdani42/nvim-web-devicons" },
    { "moll/vim-bbye" },

    -- find/replace
    { "nvim-pack/nvim-spectre" },

    -- .editorconfig
    { "gpanders/editorconfig.nvim" },

    -- database
    { "tpope/vim-dadbod" },
    { "kristijanhusak/vim-dadbod-completion" },
    { "kristijanhusak/vim-dadbod-ui" },

    -- debug
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui" },
    { "theHamsta/nvim-dap-virtual-text" },

    -- rest api
    { "NTBBloodbath/rest.nvim", lazy = true, ft = { "http" } },

    -- run unit tests
    -- {
    --     "kessejones/tester.nvim",
    --     config = function()
    --         require("tester").setup()
    --     end,
    -- },
}
