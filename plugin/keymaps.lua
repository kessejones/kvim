local keymap = require("kvim.utils.keymap")
local nmap = keymap.nmap
local vmap = keymap.vmap
local tmap = keymap.tmap

local select_all_mode = setmetatable({
    enter_select_all = function()
        local cursor = vim.api.nvim_win_get_cursor(0)
        vim.api.nvim_buf_set_var(0, "last_cursor", vim.json.encode(cursor))
        vim.cmd.normal({ bang = true, args = { "ggVG" } })
    end,
    exit_select_all = function()
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-c>", true, false, true), "n", true)
        local exists, cursor = pcall(vim.api.nvim_buf_get_var, 0, "last_cursor")
        if exists and cursor then
            vim.api.nvim_buf_del_var(0, "last_cursor")
            vim.api.nvim_win_set_cursor(0, vim.json.decode(cursor))
        end
    end,
}, {})

-- ** Normal Mode Keys

nmap("<Space>", "<NOP>", { desc = "Do anything" })
nmap("<ESC>", function()
    vim.cmd.noh()
end, { desc = "No highlight" })

nmap("<Leader>ss", function()
    vim.cmd.write()
end, { desc = "Save file" })

nmap("<Leader>sq", function()
    vim.cmd.write()
    vim.cmd.quit()
end, { desc = "Save and quit" })

-- Resize window
nmap("<C-s><C-k>", function()
    vim.cmd.wincmd("5+")
end)

nmap("<C-s><C-j>", function()
    vim.cmd.wincmd("5-")
end)

nmap("<C-s><C-h>", function()
    vim.cmd.wincmd("5<")
end)

nmap("<C-s><C-l>", function()
    vim.cmd.wincmd("5>")
end)

nmap("<C-s><C-r>", function()
    vim.cmd.wincmd("=")
end)

-- Duplicate current line
nmap("<Leader>y", function()
    vim.cmd.yank()
    vim.cmd.put()
end, { desc = "Duplicate current line" })

-- Switch to v-line mode
nmap("<Leader>v", "<S-V>", { desc = "Visual line mode" })
nmap("<Leader>d", '"_d', { desc = "Delete current line without yank" })

-- Next/Previous buffer
nmap("<S-l>", function()
    vim.cmd.bnext()
end, { desc = "Next buffer" })

nmap("<S-h>", function()
    vim.cmd.bprev()
end, { desc = "Previous buffer" })

nmap("<C-l>", function()
    vim.cmd.tabnext()
end, { desc = "Next tab" })

nmap("<C-h>", function()
    vim.cmd.tabprev()
end, { desc = "Previous tab" })

-- Close/Quit Buffers
nmap("<Leader>q", ":q<CR>", { desc = "Close current window" })

nmap("<Leader>..", function()
    local bufnr = vim.api.nvim_get_current_buf()
    if not vim.bo[bufnr].modified then
        vim.cmd.bnext()
        vim.cmd.bdelete(bufnr)
    end
end, { desc = "Delete current buffer" })

nmap("<Leader>.f", function()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.cmd.bnext()
    vim.cmd.bdelete({ args = { bufnr }, bang = true })
end, { desc = "Force delete current buffer" })

nmap("<Leader>.a", function()
    local bufs = vim.api.nvim_list_bufs()
    for _, bufnr in ipairs(bufs) do
        if not vim.bo[bufnr].modified then
            vim.cmd.bdelete(bufnr)
        else
            local name = vim.fs.basename(vim.api.nvim_buf_get_name(bufnr))
            vim.print(string.format("Buffer %s is modified, use :bd! to delete it", name))
        end
    end
end, { desc = "Delete all listed buffers" })

-- Replace
nmap("<Leader>fh", "<ESC>:%s/", { desc = "Substitute prompt" })

-- Delete
nmap("x", '"_x', { desc = "Delete character without yank" })

-- Select all
nmap("<Leader>aa", function()
    select_all_mode.enter_select_all()
end, { desc = "Select all buffer" })

-- Select all and yank
nmap("<Leader>ay", function()
    local cursor = vim.api.nvim_win_get_cursor(0)
    vim.cmd.normal({ bang = true, args = { "ggVGy" } })
    vim.api.nvim_win_set_cursor(0, cursor)
end, { desc = "Select all buffer and yank" })

nmap("gl", "$", { desc = "End of line" })
nmap("gh", "^", { desc = "Start of line" })

-- ** Visual Mode Keys

vmap("<ESC>", function()
    select_all_mode.exit_select_all()
end, { desc = "Exit select all" })

-- Replace
vmap("<C-h>", ":s/", { desc = "Substitute prompt" })
-- Move up/down selected text
vmap("<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move region down" })
vmap("<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move region up" })

-- ** Terminal mode keys

tmap("<ESC><ESC>", function()
    vim.cmd.stopinsert({ bang = true })
end, { desc = "Exit terminal mode" })

-- Close terminal window
tmap("<C-w>q", function()
    vim.cmd.wincmd("q")
end, { desc = "Close terminal window" })

-- Window navigation
tmap("<C-w>h", function()
    vim.cmd.wincmd("h")
end, { desc = "Focus left" })

tmap("<C-w>l", function()
    vim.cmd.wincmd("l")
end, { desc = "Focus right" })

tmap("<C-w>k", function()
    vim.cmd.wincmd("k")
end, { desc = "Focus up" })

tmap("<C-w>j", function()
    vim.cmd.wincmd("j")
end, { desc = "Focus down" })

tmap("<C-w>H", function()
    vim.cmd.wincmd("H")
end, { desc = "Move to left" })

tmap("<C-w>L", function()
    vim.cmd.wincmd("L")
end, { desc = "Move to right" })

tmap("<C-w>K", function()
    vim.cmd.wincmd("K")
end, { desc = "Move to up" })

tmap("<C-w>J", function()
    vim.cmd.wincmd("J")
end, { desc = "Move to left" })

-- Resize window
tmap("<C-s><C-k>", function()
    vim.cmd.wincmd("5+")
end, { desc = "Resize up" })

tmap("<C-s><C-j>", function()
    vim.cmd.wincmd("5-")
end, { desc = "Resize down" })

tmap("<C-s><C-h>", function()
    vim.cmd.wincmd("5<")
end, { desc = "Resize left" })

tmap("<C-s><C-l>", function()
    vim.cmd.wincmd("5>")
end, { desc = "Resize right" })

tmap("<C-s><C-r>", function()
    vim.cmd.wincmd("=")
end, { desc = "Resize the same size" })
