local M = { }
local keymappings = require('kvim.keymappings')

local __nsId = nil
local paddingLeft = 5
local isVisibleText = false
local defaultMessage = "Not committed yet"
local gitShowFormat = '%an - %ar - %s'

local getUntrackedFiles = function()
    local cmd = "git ls-files --others --exclude-standard"
    local result = vim.fn.system(cmd)
    return vim.split(result, '%s')
end

local getGitBlameText = function()
    local currentFile = vim.fn.expand('%')
    local line = vim.api.nvim_win_get_cursor(0)
    
    local blame = vim.fn.system(string.format('git blame -c -L %d,%d %s', line[1], line[1], currentFile))
    if string.match(blame, "no such path") then
        return ""
    end

    local hash = vim.split(blame, '%s')[1]
    if hash == '000000000' then
        return defaultMessage 
    end

    local cmd = string.format('git show %s --format="%s"', hash, gitShowFormat)
    local gitShowResult = vim.fn.system(cmd)

    local text = vim.split(gitShowResult, '\n')[1]
    if text:find("fatal") then
        return "" 
    end

    return text
end

local isNewFile = function()
    local untrackedFiles = getUntrackedFiles()
    local currentFile = vim.fn.expand('%')

    for _, p in ipairs(untrackedFiles) do
        if p == currentFile then
            return true
        end
    end
    return false
end

local getText = function()
    if isNewFile() then
        return defaultMessage
    end
    return getGitBlameText()
end

function M.blame()
    local ft = vim.fn.expand("%:h:t")
    if ft == '' or ft == 'bin' then
        return
    end
    
    M.clear()

    local text = getText()
    text = string.rep(' ', paddingLeft) .. text

    local opts = {
        virt_text = {{ text, "SpecialComment" }},
        virt_text_pos = "eol",
    }

    local line = vim.api.nvim_win_get_cursor(0)
    vim.api.nvim_buf_set_extmark(0, __nsId, line[1] -1, 0, opts) 
    isVisibleText = true
end

function M.toggle()
    if isVisibleText then
        M.clear()
    else
        M.blame()
    end
end

function M.clear()
    vim.api.nvim_buf_clear_namespace(0, __nsId, 0, -1)
    isVisibleText = false
end

function M:init()
    __nsId = vim.api.nvim_create_namespace('GitInfo')

    vim.cmd[[autocmd CursorHold * lua require'kvim.core.gitinfo'.blame()]]
    vim.cmd[[autocmd CursorMoved * lua require'kvim.core.gitinfo'.clear()]]
    vim.cmd[[autocmd CursorMovedI * lua require'kvim.core.gitinfo'.clear()]]
    vim.api.nvim_exec([[command GitInfoBlame :lua require'kvim.core.gitinfo'.blame()]], false)
    vim.api.nvim_exec([[command GitInfoBlameToggle :lua require'kvim.core.gitinfo'.toggle()]], false)

    local mappings = {
        normal_mode = {
            ["<S-T>"] = "<cmd>:GitInfoBlameToggle<CR>"
        }
    }
    
    keymappings:load(mappings)
end

return M
