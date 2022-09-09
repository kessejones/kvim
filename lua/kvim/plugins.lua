return {
    { "wbthomason/packer.nvim" },

    -- improve startup
    { "lewis6991/impatient.nvim" },

    -- coloscheme
    { "rebelot/kanagawa.nvim" },
    {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
    },
    { "lukas-reineke/indent-blankline.nvim" },

    -- elixir/mix
    { "brendalf/mix.nvim" },
    { "elixir-editors/vim-elixir" },

    -- dashboard
    { "goolord/alpha-nvim" },

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
    { "windwp/nvim-autopairs" },
    { "nvim-treesitter/nvim-treesitter", run = { ":TSUpdate" } },
    { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } },
    { "numToStr/Comment.nvim" },

    -- git
    { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } },
    { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" },
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
    { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    { "ahmedkhalf/project.nvim" },

    -- buffers/windows and tabs
    { "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" },
    { "moll/vim-bbye" },

    -- find/replace
    { "nvim-pack/nvim-spectre" },

    -- .editorconfig
    { "gpanders/editorconfig.nvim" },

    { "mattn/emmet-vim" },

    -- database
    { "tpope/vim-dadbod" },
    { "kristijanhusak/vim-dadbod-completion" },
    { "kristijanhusak/vim-dadbod-ui" },

    -- debug
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui" },
    { "theHamsta/nvim-dap-virtual-text" },

    -- rest api
    { "NTBBloodbath/rest.nvim" },
}
