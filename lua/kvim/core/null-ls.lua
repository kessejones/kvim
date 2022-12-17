local lsp = require("kvim.core.lsp")
local null_ls = require("null-ls")

local M = {}

function M.init()
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup({
        on_attach = function(client, bufnr)
            lsp.enable_format_on_save(client, bufnr)
        end,
        sources = {
            formatting.phpcsfixer.with({
                args = { "--cache-file=/dev/null", "--no-interaction", "--quiet", "fix", "$FILENAME" },
            }),
            formatting.prettierd,
            formatting.stylua.with({
                condition = function(utils)
                    return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
                end,
            }),
            diagnostics.phpmd.with({
                args = { "$FILENAME", "json", "cleancode,codesize,controversial,design,naming,unusedcode" },
            }),
            diagnostics.phpstan,
        },
    })
end

return M
