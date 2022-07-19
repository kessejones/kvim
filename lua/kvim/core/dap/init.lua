local M = {}

local keymappings = require("kvim.keymappings")
local dap = require("dap")
local dapui = require("dapui")
local dap_virtual_text = require("nvim-dap-virtual-text")

local function setup_adapters()
    dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { "/home/kesse/.temp/vscode-php-debug/out/phpDebug.js" },
    }

    dap.configurations.php = {
        {
            type = "php",
            request = "launch",
            name = "Listen for xdebug",
            port = "9000",
            log = true,
        },
    }
end

local function setup_keymappings()
    keymappings.load({
        normal_mode = {
            [",q"] = dap.step_back,
            [",w"] = dap.step_into,
            [",e"] = dap.step_over,
            [",r"] = dap.step_out,
            [",t"] = dap.continue,

            [",b"] = dap.toggle_breakpoint,
            [",g"] = dap.repl.open,
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
        callback = function()
            require("dap.ext.autocompl").attach()
        end,
    })
end

function M.init()
    setup_adapters()
    setup_ui()
    setup_keymappings()
end

return M
