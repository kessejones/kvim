return {
    "nvim-telescope/telescope.nvim",
    keys = {
        "<C-p>",
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
        {
            "ahmedkhalf/project.nvim",
            config = function()
                require("kvim.core.project").init()
            end,
        },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        require("kvim.core.telescope").init()
    end,
}
