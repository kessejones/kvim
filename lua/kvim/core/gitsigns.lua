local gitsigns = require("gitsigns")

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
        local function nmap(lhs, rhs, opts)
            vim.keymap.set("n", lhs, rhs, opts)
        end

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
