return {
    "pwntester/octo.nvim",
    cmd = "Octo",
    config = function()
        require("kvim.core.octo").init()
    end,
}
