local M = {  }

function M:init()
    require'gitsigns'.setup({
        current_line_blame = false,
    })
end

return M
