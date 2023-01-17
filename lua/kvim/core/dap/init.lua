local M = {}

local keymappings = require("kvim.keymappings")
local dap = require("dap")
local dapui = require("dapui")
local dap_virtual_text = require("nvim-dap-virtual-text")

local function setup_adapters()
    dap.adapters.php = {
        type = "executable",
        command = "php-debug-adapter",
    }

    dap.adapters.go = function(callback, _)
        local stdout = vim.loop.new_pipe(false)
        local handle, pid_or_err
        local port = 38697

        handle, pid_or_err = vim.loop.spawn("dlv", {
            stdio = { nil, stdout },
            args = { "dap", "-l", "127.0.0.1:" .. port },
            detached = true,
        }, function(code)
            stdout:close()
            handle:close()

            print("[delve] Exit Code:", code)
        end)

        assert(handle, "Error running dlv: " .. tostring(pid_or_err))

        stdout:read_start(function(err, chunk)
            assert(not err, err)

            if chunk then
                vim.schedule(function()
                    require("dap.repl").append(chunk)
                    print("[delve]", chunk)
                end)
            end
        end)

        -- Wait for delve to start
        vim.defer_fn(function()
            callback({ type = "server", host = "127.0.0.1", port = port })
        end, 100)
    end

    dap.configurations.php = {
        {
            type = "php",
            request = "launch",
            name = "Listen for xdebug",
            port = "9000",
            log = true,
        },
    }

    dap.configurations.go = {
        {
            type = "go",
            name = "Debug (from vscode-go)",
            request = "launch",
            showLog = false,
            program = "${file}",
            dlvToolPath = vim.fn.exepath("dlv"), -- Adjust to where delve is installed
        },
        {
            type = "go",
            name = "Debug (No File)",
            request = "launch",
            program = "",
        },
        {
            type = "go",
            name = "Debug",
            request = "launch",
            program = "${file}",
            showLog = true,
            -- console = "externalTerminal",
            -- dlvToolPath = vim.fn.exepath "dlv",
        },
        {
            name = "Test Current File",
            type = "go",
            request = "launch",
            showLog = true,
            mode = "test",
            program = ".",
            dlvToolPath = vim.fn.exepath("dlv"),
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
