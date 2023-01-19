return {
    "nvim-pack/nvim-spectre",
    lazy = true,
    keys = {
        {
            ";s",
            function()
                require("spectre").open()
            end,
            desc = "Spectre find all files",
        },
        {
            ";f",
            function()
                require("spectre").open_file_search()
            end,
            desc = "Spectre file search",
        },
    },
}
