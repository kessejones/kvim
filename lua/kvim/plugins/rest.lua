return {
    "rest-nvim/rest.nvim",
    ft = { "http" },
    keys = {
        "<Leader>n",
    },
    config = function()
        require("kvim.core.rest").init()
    end,
}
