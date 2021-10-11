local M = {  }

function M:init()
    require'nvim-treesitter.configs'.setup {
        highlight = {
            enable = true
        },
        indent = {
            enable = true
        }
    }
end

return M

