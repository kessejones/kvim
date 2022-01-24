local M = { }

function M.center(values)
    local fn = vim.fn
    local longest_line = fn.max(fn.map(fn.copy(values), 'strwidth(v:val)'))
    local centered_lines = fn.map(fn.copy(values), 'repeat(" ", (&columns / 2) - ('..longest_line..'/ 2)) . v:val')
    return centered_lines
end

return M

