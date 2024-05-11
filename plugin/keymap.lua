local keymap = require("kvim.utils.keymap")

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

local function indent(dir, visual)
    visual = visual or false
    local modes = setmetatable({
        visual = {
            left = "<gv",
            right = ">gv",
        },
        normal = {
            left = "<<",
            right = ">>",
        },
    }, {
        __call = function(tbl, d, v)
            local mode = v and "visual" or "normal"
            return tbl[mode][d]
        end,
    })

    local cursor = setmetatable({
        left = function()
            local cur = vim.api.nvim_win_get_cursor(0)
            local col = cur[2] - vim.bo.tabstop
            if col < 0 then
                return cur
            end

            return { cur[1], col }
        end,
        right = function()
            local cur = vim.api.nvim_win_get_cursor(0)
            local col = cur[2] + vim.bo.tabstop
            return { cur[1], col }
        end,
    }, {
        __call = function(tbl, d)
            return tbl[d]()
        end,
        __index = function()
            assert(false, "invalid function")
        end,
    })

    local mode = modes(dir, visual)
    local cur = cursor(dir)

    vim.cmd.normal({ bang = true, args = { mode } })
    vim.api.nvim_win_set_cursor(0, cur)
end

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

local keys = {
    insert_mode = {},
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
        ["<Leader>xn"] = function()
            move_buffer_to_tab("next")
        end,
        ["<Leader>xp"] = function()
            move_buffer_to_tab("prev")
        end,
        ["<Leader>.."] = function()
            local bufnr = vim.api.nvim_get_current_buf()
            if not vim.bo[bufnr].modified then
                vim.cmd.bdelete(bufnr)
            end
        end,
        ["<Leader>.f"] = function()
            local bufnr = vim.api.nvim_get_current_buf()
            vim.cmd.bdelete({ args = { bufnr }, bang = true })
        end,
        ["<Leader>.a"] = function()
            local bufs = vim.api.nvim_list_bufs()
            for _, bufnr in ipairs(bufs) do
                if not vim.bo[bufnr].modified then
                    vim.cmd.bdelete(bufnr)
                else
                    local name = vim.fs.basename(vim.api.nvim_buf_get_name(bufnr))
                    vim.print(string.format("Buffer %s is modified, use :bd! to delete it", name))
                end
            end
        end,
        -- Replace
        ["<Leader>fh"] = "<ESC>:%s/",
        -- Delete
        ["x"] = '"_x',
        -- Select all
        ["<Leader>aa"] = function()
            select_all_mode.enter_select_all()
        end,
        -- Select all and yank
        ["<Leader>ay"] = function()
            local cursor = vim.api.nvim_win_get_cursor(0)
            vim.cmd.normal({ bang = true, args = { "ggVGy" } })
            vim.api.nvim_win_set_cursor(0, cursor)
        end,
        -- Indent
        ["<"] = function()
            indent("left")
        end,
        [">"] = function()
            indent("right")
        end,
        ["gl"] = "$",
        ["gh"] = "^",

        ["n"] = "nzzzv",
        ["N"] = "Nzzzv",
    },
    visual_mode = {
        ["<ESC>"] = function()
            select_all_mode.exit_select_all()
        end,
        -- Replace
        ["<C-h>"] = ":s/",
        ["<"] = function()
            indent("left", true)
        end,
        [">"] = function()
            indent("right", true)
        end,
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

keymap.load(keys)
