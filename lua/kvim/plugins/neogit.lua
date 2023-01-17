return {
    "TimUntersberger/neogit",
    keys = {
        {
            "<Leader>gg",
            function()
                require("neogit").open({})
            end,
        },
    },
    config = function()
        require("kvim.core.neogit").init()
    end,
}
