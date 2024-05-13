local nmap = require("kvim.utils.keymap").nmap

local M = {}

function M.init()
    local flash = require("flash")
    flash.setup({
        modes = {
            char = {
                keys = { "f", "F" },
                multi_line = false,
                char_actions = function(motion)
                    return {
                        [motion:lower()] = "next",
                        [motion:upper()] = "prev",
                    }
                end,
            },
        },
        prompt = {
            enabled = false,
        },
    })

    local function jump_forward()
        flash.jump({
            search = {
                forward = true,
                multi_window = false,
                wrap = false,
            },
        })
    end

    local function jump_backward()
        flash.jump({
            search = {
                forward = false,
                wrap = false,
                multi_window = false,
            },
        })
    end

    nmap("ss", jump_forward, { desc = "Jump forward" })
    nmap("se", jump_backward, { desc = "Jump backward" })
    nmap("sa", function()
        flash.jump({ continue = true })
    end, { desc = "Jump buffer globaly" })
    nmap("st", function()
        flash.treesitter()
    end, { desc = "Select area by treesitter" })
end

return M
