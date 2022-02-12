return {
    { "wbthomason/packer.nvim" },

    -- coloscheme/visual plugins
    { "rebelot/kanagawa.nvim" },
    {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    },
    { "lukas-reineke/indent-blankline.nvim" },

    -- elixir/mix
    { "brendalf/mix-fugitive" },
    { "elixir-editors/vim-elixir" },

    -- dashboard
    { "mhinz/vim-startify" },

    -- completion
    { "onsails/lspkind-nvim" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-cmdline" },

    -- file tree
    {
        "kyazdani42/nvim-tree.lua",
        requires = { "kyazdani42/nvim-web-devicons" },
    },

    -- formatting/syntax
    { "jiangmiao/auto-pairs" },
    { "nvim-treesitter/nvim-treesitter", run = { ":TSUpdate" } },
    { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } },
    { "tpope/vim-commentary" },

    -- git
    { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } },
    { "tpope/vim-fugitive" },
    { "kessejones/git-blame-line.nvim" },

    -- laravel blade
    { "jwalton512/vim-blade" },

    -- utils
    { "szw/vim-maximizer" },
    { "tpope/vim-surround" },

    -- cursors
    { "terryma/vim-multiple-cursors" },
    { "mg979/vim-visual-multi" },

    -- terminal
    { "akinsho/toggleterm.nvim" },

    -- finder
    { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } },
    { "ahmedkhalf/project.nvim" },

    -- buffers/windows and tabs
    { "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" },
}
