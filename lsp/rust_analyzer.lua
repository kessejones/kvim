---@type vim.lsp.Config
return {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { ".git", "cargo.toml" },
    capabilities = {
        experimental = {
            serverStatusNotification = true,
        },
    },
}
