return {
    "akinsho/git-conflict.nvim",
    keys = {
        "<Leader>gq",
    },
    cmd = {
        "GitConflictListQf",
    },
    config = function()
        require("git-conflict").setup()

        require("kvim.keymappings").load({
            normal_mode = {
                ["<Leader>gq"] = ":GitConflictListQf<CR>",
            },
        })
    end,
}
