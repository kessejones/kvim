local git_blame_line = require("git-blame-line")

git_blame_line.setup({
    view = {
        clear_when_cursor_moves = true,
    },
})

vim.keymap.set("n", "<S-t>", function()
    git_blame_line.toggle()
end, { desc = "Toggle git blame current line" })

vim.keymap.set("n", "<Leader>gt", function()
    git_blame_line.open_diffview()
end, { desc = "Open diffview for current line" })
