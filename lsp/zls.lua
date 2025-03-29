---@type vim.lsp.Config
return {
    cmd = { "zls" },
    filetypes = { "zig", "zir" },
    root_markers = { ".git" },

    settings = {
        zls = {
            enable_inline_hints = true,
            enable_snippets = true,
            warn_style = true,
        },
    },

    on_init = function (client, init_result)
        vim.g.zig_fmt_parse_errors = 0
        vim.g.zig_fmt_autosave = 0
    end
}
