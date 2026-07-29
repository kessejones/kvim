local function stringify()
    local pos_start = vim.fn.getpos("'<")
    local pos_end = vim.fn.getpos("'>")
    local text = vim.fn.getregion(pos_start, pos_end)

    local result = {}
    vim.system({ "jq", "-c", "tojson" }, {
        stdin = text,
        text = true,
    }, function(output)
        result = vim.split(output.stdout, "\n")
    end):wait()

    vim.api.nvim_buf_set_text(0, pos_start[2] - 1, pos_start[3] - 1, pos_end[2] - 1, pos_end[3], result)
end

local function parse()
    local pos_start = vim.fn.getpos("'<")
    local pos_end = vim.fn.getpos("'>")
    local text = vim.fn.getregion(pos_start, pos_end)

    local result = {}
    vim.system({ "jq", "--raw-output" }, {
        stdin = text,
        text = true,
    }, function(output)
        result = vim.split(output.stdout, "\n")
    end):wait()

    vim.api.nvim_buf_set_text(0, pos_start[2] - 1, pos_start[3] - 1, pos_end[2] - 1, pos_end[3], result)
end

local commands = {
    stringify = stringify,
    parse = parse,
}

local function run(opts)
    local action = table.remove(opts.fargs, 1)
    local args = opts.fargs

    if not action then
        return
    end

    commands[action]()
end

function Complete(_, line, _)
    local result = {}
    for k, _ in pairs(commands) do
        table.insert(result, k)
    end
    return result
end

local opts = {
    nargs = "*",
    range = true,
    complete = Complete,
}

vim.api.nvim_create_user_command("Json", run, opts)
