local M = {}

local function default(value, default_value)
    if value == nil or value == 0 then
        return default_value
    end
    return value
end

function M.input(opts, on_confirm)
    opts = opts or {}

    local line = 0
    local col = 0
    local width = 0
    local height = 0

    opts.win_opts = opts.win_opts or {}

    width = default(opts.win_opts.width, math.floor(vim.o.columns / 2))
    height = default(opts.win_opts.height, 1)

    local buf = vim.api.nvim_create_buf(false, true)
    vim.bo[buf].buftype = "prompt"
    vim.bo[buf].filetype = "KvimInput"

    local win_id = vim.api.nvim_open_win(buf, true, {
        relative = "cursor",
        row = line + 1,
        col = col,
        width = width,
        height = height,
        style = "minimal",
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        zindex = 10,
        title = opts.prompt,
    })

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
        opts.default or "",
    })

    local close_window = function()
        vim.api.nvim_win_close(win_id, true)
        vim.api.nvim_buf_delete(buf, { force = true })
    end

    local on_submit = function(value)
        close_window()

        on_confirm(value)
    end

    vim.fn.prompt_setprompt(buf, "")
    vim.fn.prompt_setcallback(buf, on_submit)
    vim.fn.prompt_setinterrupt(buf, close_window)

    vim.keymap.set({ "i", "n" }, "<ESC>", close_window, { buffer = buf, silent = true })

    vim.cmd.startinsert({ bang = true })
end

function M.rename(opts, on_confirm)
    local width = 15
    if opts.default and string.len(opts.default) > 10 then
        width = math.ceil(string.len(opts.default) * 1.5)
    end

    local pos = vim.api.nvim_win_get_position(0)
    opts.win_opts = {
        line = vim.fn.winline() + 3,
        col = pos[2] + vim.fn.wincol(),
        width = width,
        height = 1,
    }
    M.input(opts, on_confirm)
end

function M.init()
    vim.ui.input = M.input
    vim.ui.rename = M.rename
end

return M
