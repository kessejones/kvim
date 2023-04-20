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
        -- Navigate in windows
        ["<Leader>h"] = function()
            vim.cmd.wincmd("h")
        end,
        ["<Leader>l"] = function()
            vim.cmd.wincmd("l")
        end,
        ["<Leader>k"] = function()
            vim.cmd.wincmd("k")
        end,
        ["<Leader>j"] = function()
            vim.cmd.wincmd("j")
        end,
        -- Window sizing
        ["<C-r><C-k>"] = function()
            vim.cmd.wincmd("5+")
        end,
        ["<C-r><C-j>"] = function()
            vim.cmd.wincmd("5-")
        end,
        ["<C-r><C-h>"] = function()
            vim.cmd.wincmd("5<")
        end,
        ["<C-r><C-l>"] = function()
            vim.cmd.wincmd("5>")
        end,
        ["<C-r><C-r>"] = function()
            vim.cmd.wincmd("=")
        end,
        -- Split window
        ["<Leader>sv"] = ":vs<CR>",
        ["<Leader>sh"] = ":sv<CR>",
        -- Duplicate current line
        ["<Leader>y"] = "<ESC>yyp",
        -- Switch to v-line mode
        ["<Leader>v"] = "<S-v>",
        -- Next/Previous buffer
        ["<S-l>"] = ":bn<CR>",
        ["<S-h>"] = ":bp<CR>",
        ["<C-l>"] = ":tabn<CR>",
        ["<C-h>"] = ":tabp<CR>",
        -- Close/Quit Buffers
        ["<Leader>q"] = ":q<CR>",
        ["<Leader>."] = ":bdelete<CR>",
        ["<Leader>.f"] = ":bdelete!<CR>",
        ["<Leader>.a"] = ":%bdelete<CR>",
        -- Replace
        ["<Leader>fh"] = "<ESC>:%s/",
        -- Delete
        ["x"] = '"_x',
        -- Select all
        ["<Leader>aa"] = "ggVG",
        -- Select all and yank
        ["<Leader>ay"] = "ggVGy",
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
    vim.g.maplocalleader = ","
    M.load(default_mappings)
end

return M
