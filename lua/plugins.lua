local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/nvim/site/pack/packer/start/packer.nvim'

if not fn.empty(install_path) then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use 'ghifarit53/tokyonight-vim'

    use 'mhinz/vim-startify'
    
    use 'liuchengxu/vim-clap'
    use 'tpope/vim-commentary'
    
    use 'prabirshrestha/vim-lsp'
    use 'mattn/vim-lsp-settings'
   
    use 'prabirshrestha/asyncomplete.vim'
    use 'prabirshrestha/asyncomplete-lsp.vim'
    use 'Shougo/deoplete.nvim'
    use 'Yggdroot/indentLine'

    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    use 'kien/ctrlp.vim'
    use 'dbeecham/ctrlp-commandpalette.vim'

    use 'glepnir/galaxyline.nvim'
    use 'mhinz/vim-signify'
    use 'jwalton512/vim-blade'
    use 'jiangmiao/auto-pairs'

    use { 'nvim-treesitter/nvim-treesitter', run = {':TSUpdate'} }
end)
