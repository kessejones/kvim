local M = {  }

function M:init()
    require'nvim-treesitter.configs'.setup {
        highlight = {
            enable = true
        },
        indent = {
            enable = false,
        },
        rainbow = {
            enable = true,
        },
    }
end

return M

