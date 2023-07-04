return {
    "rest-nvim/rest.nvim",
    ft = { "http" },
    config = function()
        require("kvim.core.rest").init()
    end,
}
