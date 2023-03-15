return {
    "kessejones/term.nvim",
    keys = { "<Leader>;" },
    config = function()
        require("kvim.core.term").init()
    end,
}
