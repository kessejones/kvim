local a = vim.api

local M = {}

local augroup_format = a.nvim_create_augroup("LspFormatting", { clear = true })

local function autocmd_format(filter, async)
    a.nvim_clear_autocmds({ buffer = 0, group = augroup_format })
    a.nvim_create_autocmd("BufWritePre", {
        buffer = 0,
        group = augroup_format,
        callback = function()
            if vim.g.auto_format then
                vim.lsp.buf.format({
                    async = async or false,
                    filter = filter,
                })
            end
        end,
    })
end

local filetype_format = setmetatable({
    typescript = function()
        autocmd_format(function(client)
            return client.name ~= "tsserver"
        end)
    end,
    javascript = function()
        autocmd_format(function(client)
            return client.name ~= "tsserver"
        end)
    end,
    lua = function()
        autocmd_format(function(client)
            return client.name ~= "lua_ls"
        end)
    end,
}, {
    __index = function()
        return function()
            autocmd_format()
        end
    end,
})

function M.init(filetype)
    filetype_format[filetype]()
end

return M
