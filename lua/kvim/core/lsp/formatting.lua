local utils = require("kvim.utils")
local a = vim.api

local data_path = vim.fn.stdpath("data")
local config_path = string.format("%s/autoformat.json", data_path)
local formatting_config = {}

local function load_config()
    -- local Path = require("plenary.path")
    -- local p = Path:new(config_path)
    -- if p:exists() then
    --     formatting_config = vim.json.decode(p:read())
    -- end
    --
    -- local root = vim.fs.root(0, { "composer.json" })
    -- if root == nil then
    --     return nil
    -- end
    --
    local fd = vim.uv.fs_open(config_path, "r", 438)
    local stat = vim.uv.fs_fstat(fd)
    if stat == nil or stat.size == 0 then
        return
    end

    local data = vim.uv.fs_read(fd, stat.size, 0)
    vim.uv.fs_close(fd)
    formatting_config = vim.json.decode(data)
end

---@param path string
---@return boolean
local function match_path(path)
    for _, p in ipairs(formatting_config) do
        if path:match(utils.escape_pattern(p)) then
            return true
        end
    end
    return false
end

local M = {}

local augroup_format = a.nvim_create_augroup("LspFormatting", { clear = true })

local function autocmd_format(filter, async)
    a.nvim_clear_autocmds({ buffer = 0, group = augroup_format })
    a.nvim_create_autocmd("BufWritePre", {
        buffer = 0,
        group = augroup_format,
        callback = function(e)
            if not match_path(e.file) and vim.g.auto_format then
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

function M.config()
    load_config()

    vim.api.nvim_create_user_command("AutoFormatEdit", function()
        vim.cmd.edit({ args = { config_path } })
    end, {})

    vim.api.nvim_create_user_command("AutoFormatReload", function()
        formatting_config = {}
        load_config()
    end, {})
end

return M
