local M = { }

function M:init()
    vim.cmd("autocmd BufWritePre *.js Prettier")
    vim.cmd("autocmd BufWritePre *.ts Prettier")
end

return M
