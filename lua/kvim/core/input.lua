local popup = require("plenary.popup")

local M = {}

local function default(value, default_value)
    if value then
        return value
    end
    return default_value
end

function M.input(opts, on_confirm)
    opts = opts or {}

    local line = 0
    local col = 0
    local width = 0
    local height = 0

    opts.win_opts = opts.win_opts or {}

    width = default(opts.win_opts.width, math.floor(vim.o.columns / 2))
    height = default(opts.win_opts.height, math.floor(vim.o.lines / 2))

    line = default(opts.win_opts.line, (vim.o.lines - height) / 2)
    col = default(opts.win_opts.col, (vim.o.columns - width) / 2)

    local buf = vim.api.nvim_create_buf(false, true)
    vim.bo[buf].buftype = "prompt"

    local win_id = popup.create(buf, {
        line = line,
        col = col,
        minwidth = width,
        height = height,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        padding = {},
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

    vim.cmd([[startinsert!]])
end

function M.rename(opts, on_confirm)
    local width = 15
    if opts.default and string.len(opts.default) > 10 then
        width = math.ceil(string.len(opts.default) * 1.5)
    end

    opts.win_opts = {
        line = vim.fn.winline() + 3,
        col = vim.fn.wincol(),
        width = width,
        height = 1,
    }
    M.input(opts, on_confirm)
end

function M.select(items, opts, on_choise)
    opts = opts or {}

    local skip_lines = 3
    local width = math.floor(vim.o.columns * 0.3)
    local height = math.floor(0.3 * (vim.o.lines - skip_lines))

    local col = (vim.o.columns - width) / 2
    local line = ((vim.o.lines - skip_lines - height) / 2)

    local buf = vim.api.nvim_create_buf(false, true)
    local win_id = popup.create(buf, {
        line = line,
        col = col,
        minwidth = width,
        minheight = height,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        padding = { 4, 4, 4, 4 },
        zindex = 10,
        title = opts.prompt,
        cursorline = true,
    })

    vim.wo[win_id].number = false
    vim.wo[win_id].relativenumber = false
    vim.bo[buf].filetype = "KvimSelect"

    local formatted_items = vim.deepcopy(items)
    if opts.format_item and type(opts.format_item) == "function" then
        formatted_items = vim.tbl_map(function(item)
            return opts.format_item(item)
        end, formatted_items or {})
    end

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, formatted_items)
    vim.bo[buf].modifiable = false

    local close_window = function()
        vim.api.nvim_win_close(win_id, true)
        vim.api.nvim_buf_delete(buf, { force = true })
    end

    vim.keymap.set({ "n" }, "<ESC>", close_window, { buffer = buf, silent = true })

    vim.keymap.set({ "n" }, "<CR>", function()
        local cursor = vim.api.nvim_win_get_cursor(0)
        local idx = cursor[1]

        close_window()
        if on_choise and type(on_choise) == "function" then
            on_choise(items[idx], idx)
        end
    end, { buffer = buf, silent = true })
end

function M.init()
    vim.ui.input = M.input
    vim.ui.select = M.select
    vim.ui.rename = M.rename
end

return M
