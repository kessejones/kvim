return {
    "mfussenegger/nvim-dap",
    dependencies = { "rcarriga/nvim-dap-ui", "theHamsta/nvim-dap-virtual-text" },
    keys = {
        "<LocalLeader>da",
        "<LocalLeader>dt",
        "<LocalLeader>db",
    },
    config = function()
        require("kvim.core.dap").init()
    end,
}
