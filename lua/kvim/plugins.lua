
return {
    { "wbthomason/packer.nvim" },

    { 'kessejones/git-blame-line.nvim' },
   
    { "elixir-editors/vim-elixir" },
    { 'mg979/vim-visual-multi' },

    { "joshdick/onedark.vim" },
    { "ghifarit53/tokyonight-vim" },
    { "mhinz/vim-startify" },
    { "tpope/vim-commentary" },
    { "prabirshrestha/vim-lsp" },
    { "mattn/vim-lsp-settings" },
    { "prabirshrestha/asyncomplete.vim" },
    { "prabirshrestha/asyncomplete-lsp.vim" },
    { "Yggdroot/indentLine" },
    {
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require'kvim.core.nvimtree':init()
        end
    },

    { "kien/ctrlp.vim" },

    { "glepnir/galaxyline.nvim" },
    { "mhinz/vim-signify" },
    { "jwalton512/vim-blade" },
    -- { "jiangmiao/auto-pairs" },

    { "nvim-treesitter/nvim-treesitter", run = {":TSUpdate"} }, 
    { "prettier/vim-prettier", run = { "yarn install"}},
    { "sbdchd/neoformat" },

    { 'szw/vim-maximizer' },
    { 'tpope/vim-surround' },
    { 'terryma/vim-multiple-cursors' },

    { "stephpy/vim-php-cs-fixer" },
}
