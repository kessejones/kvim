local M = {}

function M.center(values)
    local fn = vim.fn

    local longest_line = fn.max(fn.map(fn.copy(values), function(_, val)
        return fn.strwidth(val)
    end))

    local centered_lines = fn.map(fn.copy(values), function(_, val)
        local total_spaces = (vim.o.columns / 2) - (longest_line / 2)
        local spaces = string.rep(" ", total_spaces)
        return spaces .. val
    end)

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
