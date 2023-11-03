return {
    "rest-nvim/rest.nvim",
    ft = { "http" },
    commit = "8b62563",
    config = function()
        require("kvim.core.rest").init()
    end,
}
