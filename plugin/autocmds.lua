vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        vim.opt_local.formatoptions:remove("o")
    end,
})
