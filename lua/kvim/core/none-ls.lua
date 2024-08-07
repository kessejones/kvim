local null_ls = require("null-ls")

local M = {}

function M.init()
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions

    null_ls.setup({
        on_attach = function(_client, bufnr)
            require("kvim.core.lsp.formatting").init(vim.bo[bufnr].filetype)
        end,
        sources = {
            formatting.phpcsfixer.with({
                args = {
                    "--cache-file=/dev/null",
                    "--no-interaction",
                    "--quiet",
                    "--rules=@PSR12",
                    "fix",
                    "$FILENAME",
                },
            }),
            formatting.prettierd,
            formatting.stylua.with({
                condition = function(utils)
                    return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
                end,
            }),
            formatting.alejandra,
            formatting.ocamlformat,
            formatting.goimports,
            diagnostics.phpcs.with({
                args = {
                    "--standard=PSR12",
                    "--report=json",
                    "-q",
                    "-s",
                    "--runtime-set",
                    "ignore_warnings_on_exit",
                    "1",
                    "--runtime-set",
                    "ignore_errors_on_exit",
                    "1",
                    "--config-set php_version 8120",
                    "--stdin-path=$FILENAME",
                    "--basepath=",
                },
            }),
            code_actions.gitsigns,
        },
    })
end

return M
