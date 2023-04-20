return {
    "nvim-pack/nvim-spectre",
    lazy = true,
    keys = {
        "<LocalLeader>fs",
        "<LocalLeader>ff",
    },
    config = function()
        require("kvim.core.spectre").init()
    end,
}
