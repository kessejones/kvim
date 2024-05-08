local spectre = require("spectre")
local state = require("spectre.state")
local keymappings = require("kvim.utils.keymap")

local M = {}

local function toggle()
    if not state.is_open then
        spectre.open()
        spectre.resume_last_search()
    else
        spectre.close()
    end
end

function M.init()
    spectre.setup()

    keymappings.load({
        normal_mode = {
            ["<LocalLeader>f"] = toggle,
            ["q"] = function()
                spectre.close()
            end,
            ["<LocalLeader>e"] = spectre.open_file_search,
            ["<LocalLeader>v"] = function()
                spectre.open_visual({ select_word = true })
            end,
        },
    })
end

return M
