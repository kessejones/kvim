local M = {}

function M.center(values)
    local fn = vim.fn
    local longest_line = fn.max(fn.map(fn.copy(values), "strwidth(v:val)"))
    local centered_lines = fn.map(fn.copy(values), 'repeat(" ", (&columns / 2) - (' .. longest_line .. "/ 2)) . v:val")
    return centered_lines
end

function M.contains(list, value)
    for _, t in pairs(list) do
        if t == value then
            return true
        end
    end
    return false
end

return M
