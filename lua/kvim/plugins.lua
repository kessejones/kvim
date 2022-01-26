return {
    { "wbthomason/packer.nvim" },
    { 'kessejones/git-blame-line.nvim' },

    { 'rebelot/kanagawa.nvim' },
    { 'lukas-reineke/indent-blankline.nvim' },

    { 'brendalf/mix-fugitive'},
    { "elixir-editors/vim-elixir" },

    { 'mg979/vim-visual-multi' },
    { 'tpope/vim-fugitive' },

    { "mhinz/vim-startify" },
    { "tpope/vim-commentary" },

    { 'onsails/lspkind-nvim' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-cmdline'},
    {
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons"
    },

    { "kien/ctrlp.vim" },
    {
        "nvim-lualine/lualine.nvim",
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    },
    { "mhinz/vim-signify" },
    { "jwalton512/vim-blade" },
    { "jiangmiao/auto-pairs" },

    { "nvim-treesitter/nvim-treesitter", run = {":TSUpdate"} },

    { 'szw/vim-maximizer' },
    { 'tpope/vim-surround' },
    { 'terryma/vim-multiple-cursors' },

    { 'jose-elias-alvarez/null-ls.nvim' },
}
