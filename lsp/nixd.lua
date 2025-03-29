---@type vim.lsp.Config
return {
    cmd = { "nixd" },
    filetypes = { "nix" },
    root_markers = { ".git", "flake.nix" },
}
