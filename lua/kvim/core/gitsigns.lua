local nmap = require("kvim.utils.keymap").nmap
local vmap = require("kvim.utils.keymap").vmap
local gitsigns = require("gitsigns")

local M = {}

function M.init()
    gitsigns.setup({
        current_line_blame = false,
        numhl = true,
        preview_config = {
            border = {
                "╭",
                "─",
                "╮",
                "│",
                "╯",
                "─",
                "╰",
                "│",
            },
        },
        on_attach = function(_bufnr)
            nmap("<leader>hs", gitsigns.stage_hunk, { desc = "Stage hunk" })
            nmap("<leader>hr", gitsigns.reset_hunk, { desc = "Reset hunk" })
            nmap("<leader>hS", gitsigns.stage_buffer, { desc = "Stage buffer" })
            nmap("<leader>hu", gitsigns.undo_stage_hunk, { desc = "Undo stage hunk" })
            nmap("<leader>hR", gitsigns.reset_buffer, { desc = "Reset buffer" })
            nmap("<leader>hp", gitsigns.preview_hunk, { desc = "Preview hunk" })
            nmap("<Leader>hb", function()
                gitsigns.blame_line({ full = true })
            end, { desc = "Git blame this line" })
            nmap("<leader>hg", gitsigns.toggle_deleted, { desc = "Toggle deleted lines" })
        end,
    })
end

return M
