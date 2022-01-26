local M = {  }
local null_ls = require'null-ls'

function M:init()
    local formatting = null_ls.builtins.formatting

    null_ls.setup({
        source = {
            formatting.stylua,
            formatting.prettier,
            formatting.phpcsfixer.with({ extra_args = { '--rules=@PSR12' } }),
        }
    })
end

return M
