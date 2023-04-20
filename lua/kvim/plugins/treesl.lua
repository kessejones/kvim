return {
    "Wansmer/treesj",
    keys = {
        "<LocalLeader>ss",
        "<LocalLeader>sj",
    },
    config = function()
        require("kvim.core.treesj").init()
    end,
}
