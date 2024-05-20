local M = {}

function M.init()
    vim.filetype.add({
        mysql = function(bufnr)
            vim.bo[bufnr].filetype = "sql"
        end,
    })
end

return M
