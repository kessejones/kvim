local function get_selected_region()
    local pos_start = vim.fn.getpos("'<")
    local pos_end = vim.fn.getpos("'>")
    return vim.fn.getregion(pos_start, pos_end)
end

local function buffer_data(is_range)
    if is_range then
        return get_selected_region()
    else
        return vim.api.nvim_buf_get_lines(0, 0, -1, false)
    end
end

local function run(opts)
    local args = opts.fargs
    if #args == 0 then
        return
    end

    local lines = buffer_data(opts.range > 0)
    if #lines == 0 then
        return
    end

    local text = table.concat(lines, "\n")
    local command = args[1]
    if command == "encode" then
        local result = vim.base64.encode(text)
        vim.fn.setreg("+", result)
    elseif command == "decode" then
        local result = vim.base64.decode(text)
        vim.fn.setreg("+", result)
    end
end

vim.api.nvim_create_user_command("Base64", run, {
    nargs = "*",
    range = true,
    complete = function()
        return { "encode", "decode" }
    end,
})
