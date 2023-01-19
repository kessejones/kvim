return {
    "mfussenegger/nvim-dap",
    dependencies = { "rcarriga/nvim-dap-ui", "theHamsta/nvim-dap-virtual-text" },
    keys = {
        {
            ",a",
            function()
                require("dapui").toggle()
            end,
        },
        {
            ",t",
            function()
                require("dap").continue()
            end,
        },
        {
            ",b",
            function()
                require("dap").toggle_breakpoint()
            end,
        },
    },
    config = function()
        require("kvim.core.dap").init()
    end,
}
