local M = {  }

local keymappings = require('kvim.keymappings')

function M:init()
    require'nvim-tree'.setup()

    vim.g.nvim_tree_icon_padding = ' '
    vim.g.nvim_tree_show_icons = {
        git = 1,
        folders = 1,
        files = 1,
        folder_arrows = 0
    }

    keymappings:load {
        normal_mode = {
            ["<C-g>"] = ":NvimTreeToggle<CR>"
        }
    }
end

return M
