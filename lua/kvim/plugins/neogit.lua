return {
    "NeogitOrg/neogit",
    keys = {
        "<Leader>gg",
    },
    config = function()
        require("kvim.core.neogit").init()
    end,
}
