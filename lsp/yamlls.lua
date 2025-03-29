local root_markers = { ".git" }

---@type vim.lsp.Config
return {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
    root_dir = function(bufnr, cb)
        local root = vim.fs.root(bufnr, root_markers)
        if root then
            cb(root)
            return
        end

        -- NOTE: Use the dirname from the current buffer for single file support
        local name = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
        cb(name)
    end,
    settings = {
        redhat = {
            telemetry = {
                enabled = false,
            },
        },
    },
}
