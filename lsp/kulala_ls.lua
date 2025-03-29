---@type vim.lsp.Config
return {
    cmd = { "kulala-ls", "--stdio" },
    filetypes = { "http" },
    root_dir = function(bufnr, cb)
        local root = vim.fs.root(bufnr, { ".git" })
        if root then
            cb(root)
            return
        end

        -- NOTE: Use the dirname from the current buffer for single file support
        local name = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
        cb(name)
    end,
}
