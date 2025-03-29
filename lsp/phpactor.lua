---@type vim.lsp.Config
return {
    cmd = { "phpactor", "language-server" },
    filetypes = { "php" },
    root_markers = { ".git", "composer.json" },

    init_options = {
        ["language_server_phpstan.enabled"] = false,
        ["language_server_psalm.enabled"] = false,
        ["indexer.exclude_patterns"] = {
            "/vendor/**/Tests/**/*",
            "/vendor/**/tests/**/*",
            "/vendor/composer/**/*",
            "/runtime/**/*",
        },
    },
}
