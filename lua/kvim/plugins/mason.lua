return {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall" },
    config = function()
        require("kvim.core.mason").init()
    end,
}
