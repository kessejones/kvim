return {
    "goolord/alpha-nvim",
    event = { "VimEnter" },
    config = function()
        require("kvim.core.startify").init()
    end,
}
