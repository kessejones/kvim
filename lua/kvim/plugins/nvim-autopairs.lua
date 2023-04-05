return {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    config = function()
        require("kvim.core.nvim-autopairs").init()
    end,
}
