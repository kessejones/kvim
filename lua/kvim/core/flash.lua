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

    require("kvim.utils.keymap").load({
        normal_mode = {
            ["ss"] = jump_forward,
            ["se"] = jump_backward,
            ["sa"] = function()
                flash.jump({ continue = true })
            end,
            ["st"] = function()
                flash.treesitter()
            end,
        },
        visual_mode = {
            ["ss"] = jump_forward,
            ["se"] = jump_backward,
            ["sz"] = function()
                flash.treesitter_search()
            end,
        },
    })
end

return M
