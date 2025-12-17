vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        vim.opt_local.formatoptions:remove({ "o", "c", "r" })
    end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(args.buf)
        if mark[1] > 0 and mark[1] <= line_count then
            vim.api.nvim_win_set_cursor(0, mark)

            vim.schedule(function()
                vim.cmd("normal! zz")
            end)
        end
    end,
})

vim.api.nvim_create_autocmd("VimResized", {
    command = "wincmd =",
})

local group_focus_cursor = vim.api.nvim_create_augroup("focus_cursor_line", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    group = group_focus_cursor,
    callback = function()
        if vim.b.kvim_cursorline == true then
            vim.opt_local.cursorline = true
        end
    end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
    group = group_focus_cursor,
    callback = function()
        vim.b.kvim_cursorline = vim.wo.cursorline

        if vim.wo.cursorline then
            vim.opt_local.cursorline = false
        end
    end,
})
