---@type vim.lsp.Config
return {
    cmd = { "vscode-css-language-server", "--stdio" },
    filetypes = { "css", "less", "scss" },
    root_markers = { ".git" },
    settings = {
        css = { validate = true },
        scss = { validate = true },
    },
    init_options = {
        provideFormatter = true,
    },
}
