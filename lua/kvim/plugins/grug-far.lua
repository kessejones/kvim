return {
    "MagicDuck/grug-far.nvim",
    keys = {
        "<Leader>/r",
    },
    config = function()
        local gf = require("grug-far")
        gf.setup({
            keymaps = {
                replace = "<C-f>f",
                qflist = "<C-q>",
                gotoLocation = "<enter>",
                close = "q",
            },
        })

        require("kvim.utils.keymap").load({
            normal_mode = {
                ["<Leader>/r"] = gf.grug_far,
            },
        })
    end,
}
