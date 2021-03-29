local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/nvim/site/pack/packer/start/packer.nvim'

if fn.empty(install_path) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- use 'preservim/nerdtree'
    use 'ghifarit53/tokyonight-vim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{ 'nvim-lua/popup.nvim' }, {'nvim-lua/plenary.nvim' }}
    }
    
    use 'mhinz/vim-startify'
    -- use 'glepnir/dashboard-nvim'
    
    use 'liuchengxu/vim-clap'
    use 'tpope/vim-commentary'
    -- use 'vim-airline/vim-airline'
    -- use 'vim-airline/vim-airline-themes'
    
    use 'prabirshrestha/vim-lsp'
    use 'mattn/vim-lsp-settings'
    -- use 'nvim-lua/completion-nvim'
    use 'prabirshrestha/asyncomplete.vim'
    use 'prabirshrestha/asyncomplete-lsp.vim'
    use 'Shougo/deoplete.nvim'
    -- use 'lukas-reineke/indent-blankline.nvim'
    use 'Yggdroot/indentLine'

    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    use 'kien/ctrlp.vim'
    use 'dbeecham/ctrlp-commandpalette.vim'

    use 'glepnir/galaxyline.nvim'
    use 'mhinz/vim-signify'
end)
