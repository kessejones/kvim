local M = {  }

local generic_opts = {
    noremap = true, silent = true,
}

local mode_adapter = {
    normal_mode = "n",
    visual_mode = "v",
    visual_block_mode = "x",
    insert_mode = "i",
}

local default_mappings = {
    insert_mode = {
        -- Save file
        ["<C-s>"] = "<ESC>:w<CR>",
        -- ESC helper
        ["<C-c>"] = "<ESC>",
        ["jk"] = "<ESC>",
    },
    normal_mode = {
        ["<Space>"] = "<NOP>",

        -- Tabs
        ["<C-t>"] = ":tabnew<CR>",
        ["<Leader>tt"] = ":tabnew<CR>",
        ["<Leader>1"] = ":tabn 1<CR>",
        ["<Leader>2"] = ":tabn 2<CR>",
        ["<Leader>3"] = ":tabn 3<CR>",
        ["<Leader>4"] = ":tabn 4<CR>",
        ["<Leader>5"] = ":tabn 5<CR>",
        ["<Leader>6"] = ":tabn 6<CR>",
        ["<Leader>7"] = ":tabn 7<CR>",
        ["<Leader>8"] = ":tabn 8<CR>",
        ["<Leader>9"] = ":tabn 9<CR>",

        -- Save file
        ["<C-s>"] = ":w<CR>",
        ["<Leader>ss"] = ":w<CR>",
        ["<Leader>sq"] = ":wq<CR>",
        ["<Leader>cc"] = ":bdelete<CR>",
        
        -- Quit buffer
        ["<C-q>"] = ":q<CR>",
        ['<Leader>q'] = ":q<CR>",
        ["<C-c>"] = "<ESC>",

        -- Navigate in windows
        ["<Leader>wh"] = "<C-w>h",
        ["<Leader>wj"] = "<C-w>j",
        ["<Leader>wk"] = "<C-w>k",
        ["<Leader>wl"] = "<C-w>l",

        -- Duplicate lines
        ["<Leader>y"] = "<ESC>yyp",

        -- Next/Previous buffer
        ['<S-l>'] = ':bn<CR>',
        ['<S-h>'] = ':bp<CR>',
        ['<Leader>bq'] = ':bdelete<CR>',

        ["<C-h>"] = "<ESC>:%s/",

        -- Split window
        ["<Leader>sv"] = ":vsplit<CR>",
        ["<Leader>sh"] = ":sv<CR>",

        ["<ESC>"] = ":noh<CR>",


        --          plugins
        -- Maximizer
        ['<Leader>m'] = ":MaximizerToggle<CR>",
        -- Git fugitive
        ['<Leader>gg'] = ":G<CR>",
        ['<Leader>gc'] = ":G commit<CR>",
        ['<Leader>gs'] = ":G stash<CR>",
        ['<Leader>gd'] = ":G diff<CR>",
        ['<Leader>gpl'] = ":G pull<CR>",
        ['<Leader>gps'] = ":G push<CR>",

    },
    visual_mode = {
        ["<S-u>"] = "<ESC>viwUi",
        ["<S-u>"] = "<ESC>viwUi",
        ["<S-l>"] = "viwu<ESC>",
        ["<S-l>"] = "viwu<ESC>",
        -- Indent
        ["<"] = "<gv",
        [">"] = ">gv",
        ["<C-c>"] = "<ESC>",

        ["<Leader>cc"] = ":close<CR>",
        -- Move up/down selected text
        ['<C-j>'] = ":m '>+1<CR>gv=gv",
        ['<C-k>'] = ":m '<-2<CR>gv=gv",
    },
    visual_block_mode = {
        ["<C-c>"] = "<ESC>",
        ["<Leader>cc"] = ":close<CR>",
    }
}

function M:set_keymaps(mode, key, val)
    vim.api.nvim_set_keymap(mode, key, val, generic_opts)
end

function M:load_mode(mode, mapping)
    mode = mode_adapter[mode] and mode_adapter[mode] or mode
    for key, value in pairs(mapping) do 
        M:set_keymaps(mode, key, value)
    end 
end

function M:load(mappings)
    for mode, mapping in pairs(mappings) do 
        M:load_mode(mode, mapping)
    end
end

function M:init()
    vim.g.mapleader = ' '
    M:load(default_mappings)

    vim.cmd[[inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"]]
    vim.cmd[[inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]]
    vim.cmd[[inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"]]
end

return M

