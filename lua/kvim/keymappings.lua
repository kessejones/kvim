local M = {}

local mode_adapter = {
    normal_mode = "n",
    visual_mode = "v",
    visual_block_mode = "x",
    insert_mode = "i",
    command_mode = "c",
    terminal_mode = "t",
}

local default_mappings = {
    insert_mode = {
        -- ESC helper
        ["jk"] = "<ESC>",
    },
    normal_mode = {
        ["<Space>"] = "<NOP>",
        ["<ESC>"] = ":noh<CR>",
        ["<C-c>"] = "<ESC>",
        -- Save file
        ["<Leader>ss"] = ":w<CR>",
        ["<Leader>sq"] = ":wq<CR>",
        -- Make the current window the only one on the screen.
        ["<Leader>s="] = ":on<CR>",
        ["<Leader>ww"] = ":on<CR>",
        -- Navigate in windows
        ["<Leader>h"] = "<C-w>h",
        ["<Leader>j"] = "<C-w>j",
        ["<Leader>k"] = "<C-w>k",
        ["<Leader>l"] = "<C-w>l",
        -- Rotate windows
        ["<Leader>wr"] = "<C-w>r",
        -- Make windows to be basically the same size
        ["<Leader>r="] = "<C-w>=",
        ["<Leader>rr"] = "<C-w>=",
        -- Window sizing
        ["<Leader>rk"] = "<C-w>5+",
        ["<Leader>rj"] = "<C-w>5-",
        ["<Leader>rh"] = "<C-w>5<",
        ["<Leader>rl"] = "<C-w>5>",
        -- Split window
        ["<Leader>sv"] = ":vsplit<CR>",
        ["<Leader>sh"] = ":sv<CR>",
        -- Duplicate current line
        ["<Leader>y"] = "<ESC>yyp",
        -- Switch to v-line mode
        ["<Leader>v"] = "<S-v>",
        -- Next/Previous buffer
        ["<S-l>"] = ":bn<CR>",
        ["<S-h>"] = ":bp<CR>",
        ["<C-l>"] = ":tabnext<CR>",
        ["<C-h>"] = ":tabprev<CR>",
        -- Close/Quit Buffers
        ["<Leader>q"] = ":q<CR>",
        ["<Leader>."] = ":bdelete<CR>",
        ["<Leader>.f"] = ":bdelete!<CR>",
        ["<Leader>.a"] = ":%bdelete<CR>",
        -- Replace
        ["<Leader>fh"] = "<ESC>:%s/",
        -- Delete
        ["<Leader>d"] = '"_d',
        ["x"] = '"_x',
        -- Select all
        ["<Leader>aa"] = "gg<S-v>G",
        ["<Leader>ay"] = "gg<S-v>Gy",
        -- Indent
        ["<"] = "<<<ESC>",
        [">"] = ">><ESC>",
    },
    visual_mode = {
        -- Replace
        ["<C-h>"] = ":s/",
        -- Indent
        ["<"] = "<gv",
        [">"] = ">gv",
        -- Move up/down selected text
        ["<C-j>"] = ":m '>+1<CR>gv=gv",
        ["<C-k>"] = ":m '<-2<CR>gv=gv",
    },
    visual_block_mode = {},
    command_mode = {},
    terminal_mode = {
        ["<ESC><ESC>"] = function()
            vim.cmd.stopinsert({ bang = true })
        end,
        ["<C-w>q"] = function()
            vim.cmd.wincmd("q")
        end,
        ["<C-w>h"] = function()
            vim.cmd.wincmd("h")
        end,
        ["<C-w>l"] = function()
            vim.cmd.wincmd("l")
        end,
        ["<C-w>k"] = function()
            vim.cmd.wincmd("k")
        end,
        ["<C-w>j"] = function()
            vim.cmd.wincmd("j")
        end,
        ["<C-w>H"] = function()
            vim.cmd.wincmd("H")
        end,
        ["<C-w>L"] = function()
            vim.cmd.wincmd("L")
        end,
        ["<C-w>K"] = function()
            vim.cmd.wincmd("K")
        end,
        ["<C-w>J"] = function()
            vim.cmd.wincmd("J")
        end,
    },
}

function M.set_keymaps(mode, key, val, bufnr)
    local opts = {
        noremap = true,
        silent = true,
        buffer = bufnr,
    }
    vim.keymap.set(mode, key, val, opts)
end

function M.load_mode(mode, mapping, bufnr)
    mode = mode_adapter[mode] and mode_adapter[mode] or mode
    for key, value in pairs(mapping) do
        M.set_keymaps(mode, key, value, bufnr)
    end
end

function M.load(mappings, bufnr)
    for mode, mapping in pairs(mappings) do
        M.load_mode(mode, mapping, bufnr)
    end
end

function M.init()
    vim.g.mapleader = " "
    M.load(default_mappings)
end

return M
