return {
    "mistweaverco/kulala.nvim",
    ft = { "http" },
    config = function()
        require("kvim.core.kulala").init()
    end,
}
