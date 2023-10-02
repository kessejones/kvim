return {
    "nvim-pack/nvim-spectre",
    lazy = true,
    keys = {
        "<LocalLeader>fs",
        "<LocalLeader>ff",
        "<Leader>sw",
        "<Leader>sf",
        "<Leader>st",
        "<Leader>sr",
    },
    config = function()
        require("kvim.core.spectre").init()
    end,
}
