
return {
    { "wbthomason/packer.nvim" },

    { "joshdick/onedark.vim" },
    { "ghifarit53/tokyonight-vim" },
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
        config = function()
            require'kvim.core.nvimtree':init()
        end
    },

    { "kien/ctrlp.vim" },
    { "dbeecham/ctrlp-commandpalette.vim" },

    { "glepnir/galaxyline.nvim" },
    { "mhinz/vim-signify" },
    { "jwalton512/vim-blade" },
    { "jiangmiao/auto-pairs" },

    { "nvim-treesitter/nvim-treesitter", run = {":TSUpdate"} }, 
    { "prettier/vim-prettier", run = { "yarn install"}},
    { "sbdchd/neoformat" },
}
