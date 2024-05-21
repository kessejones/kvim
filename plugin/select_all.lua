local a = vim.api
local keymap = require("kvim.utils.keymap")

local function enter()
    local cursor = a.nvim_win_get_cursor(0)
    a.nvim_buf_set_var(0, "last_cursor", vim.json.encode(cursor))
    vim.cmd.normal({ bang = true, args = { "ggVG" } })
end

local function exit()
    a.nvim_feedkeys(a.nvim_replace_termcodes("<C-c>", true, false, true), "n", true)
    local ok, cursor = pcall(a.nvim_buf_get_var, 0, "last_cursor")
    if ok and cursor then
        a.nvim_buf_del_var(0, "last_cursor")
        a.nvim_win_set_cursor(0, vim.json.decode(cursor))
    end
end

keymap.nmap("<Leader>aa", enter, { desc = "Select all buffer" })

keymap.vmap("<ESC>", exit, { desc = "Exit select all" })
