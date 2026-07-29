require("kvim.core.mini.picker")

require("mini.pick").setup({
    mappings = {
        caret_left = "<Left>",
        caret_right = "<Right>",

        choose = "<CR>",
        choose_in_split = "<C-s>",
        choose_in_tabpage = "<C-t>",
        choose_in_vsplit = "<C-v>",
        choose_marked = "<M-CR>",

        delete_char = "<BS>",
        delete_char_right = "<Del>",
        delete_left = "<C-u>",
        delete_word = "<C-w>",

        move_down = "<C-j>",
        move_start = "<C-g>",
        move_up = "<C-k>",

        paste = "<C-r>",

        scroll_down = "<C-f>",
        scroll_left = "<C-h>",
        scroll_right = "<C-l>",
        scroll_up = "<C-b>",

        stop = "<Esc>",
    },
    window = {
        config = function()
            return {
                relative = "editor",
                border = { "▔", "▔", "▔", " ", " ", " ", " ", " " },
                width = vim.o.columns,
                height = math.ceil(vim.o.lines * 0.3),
            }
        end,
    },
})
