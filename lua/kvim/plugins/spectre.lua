return {
    "nvim-pack/nvim-spectre",
    lazy = true,
    keys = {
        "<LocalLeader>f",
        "<LocalLeader>e",
        "<LocalLeader>v",
    },
    config = function()
        require("kvim.core.spectre").init()
    end,
}
