return {
    "akinsho/git-conflict.nvim",
    event = { "BufReadPre" },
    keys = {
        "<Leader>gq",
    },
    cmd = {
        "GitConflictListQf",
    },
    config = function()
        require("git-conflict").setup()

        require("kvim.utils.keymap").load({
            normal_mode = {
                ["<Leader>gq"] = ":GitConflictListQf<CR>",
            },
        })
    end,
}
