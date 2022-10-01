local popup = require("plenary.popup")

local M = {}

function M.input(opts, on_confirm)
    opts = opts or {}

    local line = vim.fn.winline()
    local col = vim.fn.wincol()

    local buf = vim.api.nvim_create_buf(false, true)
    vim.bo[buf].buftype = "prompt"

    local minwidth = 15
    if opts.default and string.len(opts.default) > 10 then
        minwidth = math.ceil(string.len(opts.default) * 1.5)
    end

    local win_id = popup.create(buf, {
        line = line + 3,
        col = col,
        minwidth = minwidth,
        height = 1,
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

function M.init()
    vim.ui.input = M.input
end

return M
