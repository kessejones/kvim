return {
    "nvim-telescope/telescope.nvim",
    keys = {
        "<C-p>",
        "gR",
        "gI",
        "gk",
        "<Leader>p",
        "<Leader>fl",
        "<Leader>fb",
        "<Leader>fr",
        "<Leader>fs",
        "<Leader>fg",
        "<Leader>fn",
        "<Leader>fc",
        "<Leader>fp",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        require("kvim.core.telescope").init()
    end,
}
