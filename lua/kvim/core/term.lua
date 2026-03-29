local term = require("term")

term.setup({
    width = 0.9,
    height = 0.9,
    position = "center",
})

vim.keymap.set("n", "<Leader>;", term.toggle, { desc = "Toggle terminal" })

vim.api.nvim_create_autocmd("TermOpen", {
    callback = function(args)
        if vim.bo[args.buf].filetype == "Term" then
            vim.keymap.set("t", "<Leader>;", term.toggle, { desc = "Toggle terminal", buffer = args.buf })
            vim.keymap.set("t", "<C-n>", term.next, { desc = "Go to next terminal", buffer = args.buf })
            vim.keymap.set("t", "<C-p>", term.prev, { desc = "Go to next terminal", buffer = args.buf })
            vim.keymap.set("t", "<C-o>", term.new, { desc = "Open new terminal", buffer = args.buf })
        end
    end,
})
