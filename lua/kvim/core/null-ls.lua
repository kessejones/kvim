local null_ls = require('null-ls')

local M = {  }

function M:init()
    local enable_format_on_save = true
    local formatting = null_ls.builtins.formatting

    null_ls.setup({
        on_attach = function(client)
            if enable_format_on_save and client.resolved_capabilities.document_formatting then
                vim.cmd([[
                    augroup LspFormatting
                        autocmd! * <buffer>
                        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
                    augroup END
                ]])
            end
        end,
        source = {
            formatting.prettier,
            formatting.phpcsfixer.with({ extra_args = { '--rules=@PSR12' } }),
            formatting.stylua.with({
                condition = function(utils)
                    return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
                end,
            })
        }
    })
end

return M
