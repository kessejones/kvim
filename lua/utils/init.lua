local utils = { }

local scopes = { o = vim.o, w = vim.wo, b = vim.bo, g = vim.g }

function utils.opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

function utils.map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if not opts then 
        vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    else
        vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
    end
end

function utils.center(values)
    local fn = vim.fn
    local longest_line = fn.max(fn.map(fn.copy(values), 'strwidth(v:val)'))
    local centered_lines = fn.map(fn.copy(values), 'repeat(" ", (&columns / 2) - ('..longest_line..'/ 2)) . v:val')
    return centered_lines
end



return utils
