return {
    "mfussenegger/nvim-dap",
    dependencies = { "rcarriga/nvim-dap-ui", "theHamsta/nvim-dap-virtual-text" },
    keys = {
        ",a",
        ",t",
        ",b",
    },
    config = function()
        require("kvim.core.dap").init()
    end,
}
