local null_ls = require("null-ls")

local M = {}

function M.init()
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup({
        on_attach = function(client, bufnr)
            require("kvim.core.lsp.formatting").init(vim.bo[bufnr].filetype)
        end,
        sources = {
            formatting.phpcsfixer.with({
                args = { "--cache-file=/dev/null", "--no-interaction", "--quiet", "--rules=@PSR12", "fix", "$FILENAME" },
            }),
            formatting.prettierd,
            formatting.stylua.with({
                condition = function(utils)
                    return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
                end,
            }),
            formatting.alejandra,
            diagnostics.phpcs.with({
                args = {
                    "--standard=PSR1,PSR12",
                    "--report=json",
                    "-q",
                    "-s",
                    "--runtime-set",
                    "ignore_warnings_on_exit",
                    "1",
                    "--runtime-set",
                    "ignore_errors_on_exit",
                    "1",
                    "--stdin-path=$FILENAME",
                    "--basepath=",
                },
            }),
        },
    })
end

return M
