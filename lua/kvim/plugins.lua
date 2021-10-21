
return {
    { "wbthomason/packer.nvim" },

    -- { "ghifarit53/tokyonight-vim" },
    { 'iCyMind/NeoSolarized' },
    { "mhinz/vim-startify" },
    
    { "liuchengxu/vim-clap" },
    { "tpope/vim-commentary" },
    { "prabirshrestha/vim-lsp" },
    { "mattn/vim-lsp-settings" },
    { "prabirshrestha/asyncomplete.vim" },
    { "prabirshrestha/asyncomplete-lsp.vim" },
    { "Shougo/deoplete.nvim" },
    { "Yggdroot/indentLine" },
    {
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
    },

    { "kien/ctrlp.vim" },
    { "dbeecham/ctrlp-commandpalette.vim" },

    { "glepnir/galaxyline.nvim" },
    { "mhinz/vim-signify" },
    { "jwalton512/vim-blade" },
    { "jiangmiao/auto-pairs" },

    { "nvim-treesitter/nvim-treesitter", run = {":TSUpdate"} }, 
}
