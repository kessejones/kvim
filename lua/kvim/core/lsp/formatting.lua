local a = vim.api

local data_path = vim.fn.stdpath("data")
local cache_config = string.format("%s/autoformat.json", data_path)

local M = {}

local cache = {}

local augroup_format = a.nvim_create_augroup("LspFormatting", { clear = true })

local function match_path(path)
    for _, p in ipairs(cache) do
        if path:match(p) then
            return true
        end
    end
    return false
end

local function autocmd_format(filter, async)
    a.nvim_clear_autocmds({ buffer = 0, group = augroup_format })
    a.nvim_create_autocmd("BufWritePre", {
        buffer = 0,
        group = augroup_format,
        callback = function(e)
            if match_path(e.file) then
                return
            end
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

local function load_config()
    local Path = require("plenary.path")
    local path_cache_file = Path.new(cache_config)
    if path_cache_file:exists() then
        cache = vim.json.decode(path_cache_file:read())
    end
end

function M.init_config()
    load_config()
    vim.api.nvim_create_user_command("AutoFormatEdit", function()
        vim.cmd.edit({ args = { cache_config } })
    end, {})
    vim.api.nvim_create_user_command("AutoFormatReload", function()
        cache = {}
        load_config()
    end, {})
end

return M
