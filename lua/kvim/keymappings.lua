local M = {}

local generic_opts = {
    noremap = true,
    silent = true,
}

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
        -- Save file
        ["<C-s>"] = "<ESC>:w<CR>",

        -- ESC helper
        ["jk"] = "<ESC>",

        -- move line up/down
        ["<C-j>"] = "<ESC>:m .+1<CR>==gi",
        ["<C-k>"] = "<ESC>:m .-2<CR>==gi",
    },
    normal_mode = {
        ["<Space>"] = "<NOP>",
        ["<ESC>"] = ":noh<CR>",
        ["<C-c>"] = "<ESC>",

        -- Save file
        ["<Leader>ss"] = ":w<CR>",
        ["<Leader>sq"] = ":wq<CR>",

        -- Navigate in windows
        ["<Leader>wh"] = "<C-w>h",
        ["<Leader>wj"] = "<C-w>j",
        ["<Leader>wk"] = "<C-w>k",
        ["<Leader>wl"] = "<C-w>l",

        -- Rotate windows
        ["<Leader>wr"] = "<C-w>r",

        -- Split window
        ["<Leader>sv"] = ":vsplit<CR>",
        ["<Leader>sh"] = ":sv<CR>",

        -- Duplicate current line
        ["<Leader>y"] = "<ESC>yyp",

        -- Next/Previous buffer
        ["<S-l>"] = ":bn<CR>",
        ["<S-h>"] = ":bp<CR>",

        -- Close/Quit Buffers
        ["<Leader>q"] = ":q<CR>",
        ["<Leader>."] = ":bdelete<CR>",

        -- Replace
        ["<C-h>"] = "<ESC>:%s/",

        -- Delete
        ["<Leader>d"] = '"_d',
        ["x"] = '"_x',

        -- Select all
        ["<C-a>"] = "gg<S-v>G",
    },
    visual_mode = {
        -- Indent
        ["<"] = "<gv",
        [">"] = ">gv",
        ["<C-c>"] = "<ESC>",

        -- Move up/down selected text
        ["<C-j>"] = ":m '>+1<CR>gv=gv",
        ["<C-k>"] = ":m '<-2<CR>gv=gv",
    },
    visual_block_mode = {
        -- ESC helper
        ["<C-c>"] = "<ESC>",
    },
    command_mode = {
        -- ESC helper
        ["<C-c>"] = "<ESC>",
    },
}

function M.set_keymaps(mode, key, val, bufnr)
    if not bufnr then
        vim.api.nvim_set_keymap(mode, key, val, generic_opts)
    else
        vim.api.nvim_buf_set_keymap(bufnr, mode, key, val, generic_opts)
    end
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
