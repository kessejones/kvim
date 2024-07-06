return {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    keys = {
        "<C-p>",
        "<Leader>p",
        "<Leader>fl",
        "<Leader>fb",
        "<Leader>fd",
        "<Leader>fr",
        "<Leader>fs",
        "<Leader>fg",
        "<Leader>fn",
        "<Leader>f/",
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
