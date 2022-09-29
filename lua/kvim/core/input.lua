local popup = require("plenary.popup")
-- local keymappings = require("kvim.keymappings")

local M = {}

function M.input(opts, on_confirm)
    opts = opts or {}

    local pos = vim.fn.getpos(".")
    local buf = vim.api.nvim_create_buf(false, true)

    local columns = vim.o.columns
    local width = math.ceil(columns * 0.3)

    local win_id = popup.create(buf, {
        line = pos[2] + 3,
        col = pos[3] + 4,
        minwidth = width,
        minheight = 1,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        padding = {},
        zindex = 10,
    })

    vim.api.nvim_buf_set_lines(buf, 1, 2, {
        opts.default or "",
    })

    vim.cmd([[startinsert]])

    vim.keymap.set({ "i", "n" }, "<ESC>", function()
        vim.api.nvim_win_close(win_id, true)
        vim.api.nvim_buf_delete(buf, {})
    end, { buffer = buf })

    vim.keymap.set({ "i", "n" }, "<enter>", function()
        local value = vim.api.nvim_buf_get_lines(buf, 0, 1, false)
        if on_confirm and type(on_confirm) == "function" then
            on_confirm(value[1])
        end
        vim.api.nvim_win_close(win_id, true)
        vim.api.nvim_buf_delete(buf, {})
    end, { buffer = buf })
end

function M.init()
    -- keymappings.load({
    --     normal_mode = {
    --         ["<leader>h"] = function()
    --             M.input("teste", function(value)
    --                 vim.pretty_print(value)
    --             end)
    --         end,
    --     },
    -- })
    vim.ui.input = M.input
end

return M
