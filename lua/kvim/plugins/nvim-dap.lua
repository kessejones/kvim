return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "rcarriga/nvim-dap",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
    },
    keys = {
        "<LocalLeader>da",
        "<LocalLeader>dt",
        "<LocalLeader>db",
    },
    config = function()
        require("kvim.core.dap").init()
    end,
}
