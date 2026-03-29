local gf = require("grug-far")

gf.setup({
    keymaps = {
        replace = "<C-f>f",
        qflist = "<C-q>",
        gotoLocation = "<enter>",
        close = "q",
    },
})

vim.keymap.set("n", "<Leader>/r", gf.grug_far, {})
