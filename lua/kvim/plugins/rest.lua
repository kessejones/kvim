return {
    "NTBBloodbath/rest.nvim",
    ft = { "http" },
    keys = {
        {
            "<Leader>n",
            function()
                require("rest-nvim").run()
            end,
            desc = "Rest run",
        },
    },
}
