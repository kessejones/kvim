local M = {}

local mode_adapter = {
    normal_mode = "n",
    visual_mode = "v",
    visual_block_mode = "x",
    insert_mode = "i",
    command_mode = "c",
    terminal_mode = "t",
}

local function move_buffer_to_tab(dir)
    vim.validate({
        dir = {
            dir,
            function(val)
                return val == "next" or val == "prev"
            end,
        },
    })

    local bufnr = vim.api.nvim_get_current_buf()
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    if bufname:match("^term://") then
        return
    end

    if not vim.bo[bufnr].modified then
        local cur_tabid = vim.api.nvim_get_current_tabpage()
        vim.cmd.bdelete({ args = { bufnr }, bang = true })

        if dir == "next" then
            vim.cmd.tabnext()
        elseif dir == "prev" then
            vim.cmd.tabprev()
        else
            assert(false)
        end

        if vim.api.nvim_get_current_tabpage() == cur_tabid then
            vim.cmd.tabnew(bufname)
        else
            vim.cmd.edit(bufname)
        end
    end
end

local default_mappings = {
    insert_mode = {
        -- ESC helper
        ["jk"] = "<ESC>",
    },
    normal_mode = {
        ["<Space>"] = "<NOP>",
        ["<ESC>"] = function()
            vim.cmd.noh()
        end,
        ["<C-c>"] = "<ESC>",
        -- Save file
        ["<Leader>ss"] = function()
            vim.cmd.write()
        end,
        ["<Leader>sq"] = function()
            vim.cmd.write()
            vim.cmd.quit()
        end,
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
        ["<C-s><C-k>"] = function()
            vim.cmd.wincmd("5+")
        end,
        ["<C-s><C-j>"] = function()
            vim.cmd.wincmd("5-")
        end,
        ["<C-s><C-h>"] = function()
            vim.cmd.wincmd("5<")
        end,
        ["<C-s><C-l>"] = function()
            vim.cmd.wincmd("5>")
        end,
        ["<C-s><C-r>"] = function()
            vim.cmd.wincmd("=")
        end,
        -- Split window
        ["<Leader>sv"] = function()
            vim.cmd.split({ mods = { split = "botright" } })
        end,
        ["<Leader>sh"] = function()
            vim.cmd.split({ mods = { vertical = true, split = "topleft" } })
        end,
        -- Duplicate current line
        ["<Leader>y"] = function()
            vim.cmd.yank()
            vim.cmd.put()
        end,
        -- Switch to v-line mode
        ["<Leader>v"] = "<S-V>",
        ["<Leader>d"] = '"_d',
        -- Next/Previous buffer
        ["<S-l>"] = function()
            vim.cmd.bnext()
        end,
        ["<S-h>"] = function()
            vim.cmd.bprev()
        end,
        ["<C-l>"] = function()
            vim.cmd.tabnext()
        end,
        ["<C-h>"] = function()
            vim.cmd.tabprev()
        end,
        -- Close/Quit Buffers
        ["<Leader>q"] = function()
            vim.cmd.quit()
        end,
        ["<Leader>."] = function()
            local bufnr = vim.api.nvim_get_current_buf()
            if not vim.bo[bufnr].modified then
                vim.cmd.bdelete(bufnr)
            end
        end,
        ["<Leader>xn"] = function()
            move_buffer_to_tab("next")
        end,
        ["<Leader>xp"] = function()
            move_buffer_to_tab("prev")
        end,
        ["<Leader>.f"] = function()
            local bufnr = vim.api.nvim_get_current_buf()
            vim.cmd.bdelete({ args = { bufnr }, bang = true })
        end,
        ["<Leader>.a"] = function()
            vim.cmd.bdelete(vim.api.nvim_list_bufs())
        end,
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
        ["gl"] = "$",
        ["gh"] = "^",

        ["n"] = "nzzzv",
        ["N"] = "Nzzzv",
    },
    visual_mode = {
        -- Replace
        ["<C-h>"] = ":s/",
        ["p"] = '"_dP',
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
        -- Window sizing
        ["<C-s><C-k>"] = function()
            vim.cmd.wincmd("5+")
        end,
        ["<C-s><C-j>"] = function()
            vim.cmd.wincmd("5-")
        end,
        ["<C-s><C-h>"] = function()
            vim.cmd.wincmd("5<")
        end,
        ["<C-s><C-l>"] = function()
            vim.cmd.wincmd("5>")
        end,
        ["<C-s><C-r>"] = function()
            vim.cmd.wincmd("=")
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
