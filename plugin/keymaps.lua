local keymap = require("kvim.utils.keymap")

local nmap = keymap.nmap
local vmap = keymap.vmap
local tmap = keymap.tmap

-- ** Normal Mode Keys

nmap("<Space>", "<NOP>", { desc = "Do anything" })

nmap("<Leader>w", vim.cmd.write, { desc = "Save file" })

nmap("k", function()
    if vim.v.count == 0 then
        return "gk"
    end
    return "k'"
end, { expr = true })

nmap("j", function()
    if vim.v.count == 0 then
        return "gj"
    end
    return "j'"
end, { expr = true })

nmap("<ESC>", function()
    if vim.opt.hlsearch:get() then
        vim.cmd.nohl()
        return ""
    end
    return ""
end, { desc = "No highlight", expr = true })

-- Resize window
nmap("<C-s>k", function()
    vim.cmd.wincmd("5+")
end)

nmap("<C-s>j", function()
    vim.cmd.wincmd("5-")
end)

nmap("<C-s>h", function()
    vim.cmd.wincmd("5<")
end)

nmap("<C-s>l", function()
    vim.cmd.wincmd("5>")
end)

nmap("<C-s>r", function()
    vim.cmd.wincmd("=")
end)

-- Duplicate current line
nmap("yp", '"zyy"zp', { desc = "Duplicate current line" })

-- Enter in visual mode
nmap("vv", "V", { desc = "Visual mode linewise" })
nmap("vl", "v$", { desc = "Visual mode from current position to end of line" })
nmap("vh", "v^", { desc = "Visual mode from current position to start of line " })

-- Tabs
nmap("<C-l>", vim.cmd.tabnext, { desc = "Tab next" })
nmap("<C-h>", vim.cmd.tabprev, { desc = "Tab prev" })
nmap("<C-S-l>", ":tabmove+1<CR>", { desc = "Tab move prev" })
nmap("<C-S-h>", ":tabmove-1<CR>", { desc = "Tab move next" })
nmap("te", vim.cmd.tabedit, { desc = "Tab edit" })
nmap("to", vim.cmd.tabonly, { desc = "Tab only current" })
nmap("tq", vim.cmd.tabclose, { desc = "Tab close" })

nmap("gK", vim.cmd.cprev, { desc = "Quickfix next" })
nmap("gJ", vim.cmd.cnext, { desc = "Quickfix prev" })

-- Close/Quit Buffers
nmap("<Leader>q", ":q<CR>", { desc = "Close current window" })
nmap("<Leader>Q", ":q!<CR>", { desc = "Close Force current window" })
nmap("<Leader>x", ":wq<CR>", { desc = "Save and close current window" })
nmap("<Leader>z", ":qall<CR>", { desc = "Quit all" })

-- Replace
nmap("<Leader>fh", "<ESC>:%s/", { desc = "Substitute prompt" })

-- Delete
nmap("x", '"_x', { desc = "Delete character without yank" })

-- Select all and yank
nmap("yA", function()
    local cursor = vim.api.nvim_win_get_cursor(0)
    vim.cmd.normal({ bang = true, args = { "ggVGy" } })
    vim.api.nvim_win_set_cursor(0, cursor)
end, { desc = "Select all buffer and yank" })

nmap("gl", "$", { desc = "End of line" })
nmap("gh", "^", { desc = "Start of line" })

-- ** Visual Mode Keys

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
tmap("<C-w><C-k>", function()
    vim.cmd.wincmd("5+")
end, { desc = "Resize up" })

tmap("<C-w><C-j>", function()
    vim.cmd.wincmd("5-")
end, { desc = "Resize down" })

tmap("<C-w><C-h>", function()
    vim.cmd.wincmd("5<")
end, { desc = "Resize left" })

tmap("<C-w><C-l>", function()
    vim.cmd.wincmd("5>")
end, { desc = "Resize right" })

tmap("<C-w><C-r>", function()
    vim.cmd.wincmd("=")
end, { desc = "Resize the same size" })

tmap("<C-w>q", function()
    vim.cmd.wincmd("q")
end, { desc = "Window close" })
