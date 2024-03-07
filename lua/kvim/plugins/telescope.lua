return {
    "nvim-telescope/telescope.nvim",
    keys = {
        "<C-p>",
        "gr",
        "gI",
        "gu",
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
        "nvim-telescope/telescope-ui-select.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        require("kvim.core.telescope").init()
    end,
}
