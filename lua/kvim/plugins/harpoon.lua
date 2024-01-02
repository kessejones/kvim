return {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    keys = {
        "tt",
        "tl",
        "th",
        "ta",
        "tp",
    },
    config = function()
        require("kvim.core.harpoon").init()
    end,
}
