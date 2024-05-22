local mc = require("multiple-cursors")
local keymap = require("kvim.utils.keymap")
local nmap = keymap.nmap
local vmap = keymap.vmap

local M = {}

function M.init()
    mc.setup({
        pre_hook = function()
            require("nvim-autopairs").disable()
        end,
        post_hook = function()
            require("nvim-autopairs").enable()
        end,
    })

    nmap("<C-S-K>", mc.add_cursor_up, { desc = "Add cursor up" })
    nmap("<C-S-J>", mc.add_cursor_down, { desc = "Add cursor down" })
    nmap("<C-n>a", mc.add_cursors_to_matches, { desc = "Add cursor for all matches" })
    nmap("<C-n>n", mc.add_cursor_and_jump_to_next_match, { desc = "Add cursor for next match" })
    nmap("<C-n>N", mc.jump_to_next_match, { desc = "Jump to next match" })
    nmap("<C-n>l", mc.lock, { desc = "Lock cursors" })

    vmap("<C-n>a", mc.add_cursors_to_matches, { desc = "Add cursor to all matches" })
    vmap("<C-n>n", mc.add_cursor_and_jump_to_next_match, { desc = "Add cursor for next match" })
    vmap("<C-n>N", mc.jump_to_next_match, { desc = "Jump to next match" })
end

return M
