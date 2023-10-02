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

    require("kvim.keymappings").load({
        normal_mode = {
            ["ss"] = function()
                flash.jump({
                    search = {
                        forward = true,
                        multi_window = false,
                        wrap = false,
                    },
                })
            end,
            ["sa"] = function()
                flash.jump({ continue = true })
            end,
            ["se"] = function()
                flash.jump({
                    search = {
                        forward = false,
                        wrap = false,
                        multi_window = false,
                    },
                })
            end,
        },
    })
end

return M
