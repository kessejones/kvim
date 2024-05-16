return {
    "NeogitOrg/neogit",
    branch = "nightly",
    keys = { "<Leader>gg" },
    config = function()
        require("kvim.core.neogit").init()
    end,
}
