local M = {}

local keymappings = require("kvim.utils.keymap")

local dap = require("dap")
local dapui = require("dapui")
local dap_virtual_text = require("nvim-dap-virtual-text")

local function setup_adapters()
    dap.adapters.gdb = {
        id = "gdb",
        type = "executable",
        command = "gdb",
        args = { "--quiet", "--interpreter=dap" },
        target = "localhost:1234",
    }

    dap.adapters.php = {
        type = "executable",
        command = "php-debug-adapter",
    }

    dap.configurations.go = {}

    dap.configurations.php = {
        {
            type = "php",
            request = "launch",
            name = "Listen for Xdebug",
            port = 9009,
        },
    }

    dap.configurations.zig = {
        {
            name = "Attach to process (GDB)",
            type = "gdb",
            request = "launch",
            cwd = "${workspaceFolder}",
        },
    }
end

local function setup_keymappings()
    keymappings.load({
        normal_mode = {
            ["<LocalLeader>dq"] = dap.step_back,
            ["<LocalLeader>dw"] = dap.step_into,
            ["<LocalLeader>de"] = dap.step_over,
            ["<LocalLeader>dr"] = dap.step_out,
            ["<LocalLeader>dt"] = dap.continue,
            ["<LocalLeader>ds"] = dap.close,
            ["<LocalLeader>da"] = dapui.toggle,
            ["<LocalLeader>db"] = dap.toggle_breakpoint,
            ["<LocalLeader>dg"] = dap.repl.open,
            ["<LocalLeader>dv"] = function()
                dapui.eval()
            end,
        },
        visual_mode = {
            ["<LocalLeader>dv"] = function()
                dapui.eval()
            end,
        },
    })

    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end
end

local function setup_ui()
    dapui.setup({
        layouts = {
            {
                elements = {
                    {
                        id = "scopes",
                        size = 0.25,
                    },
                    "breakpoints",
                    "stacks",
                },
                size = 40,
                position = "left",
            },
            {
                elements = { "repl", "console" },
                size = 0.25,
                position = "bottom",
            },
        },
    })

    dap_virtual_text.setup()

    vim.api.nvim_create_augroup("DapRepl", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
        group = "DapRepl",
        pattern = "dap-repl",
        callback = function(args)
            require("dap.ext.autocompl").attach()
            vim.bo[args.buf].buflisted = false
        end,
    })

    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Breakpoint", linehl = "", numhl = "" })
end

function M.init()
    setup_adapters()
    setup_ui()
    setup_keymappings()
end

return M
