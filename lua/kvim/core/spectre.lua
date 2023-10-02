local spectre = require("spectre")
local state = require("spectre.state")
local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
    spectre.setup()

    keymappings.load({
        normal_mode = {
            ["<LocalLeader>fs"] = spectre.open,
            ["<LocalLeader>ff"] = spectre.open_file_search,

            ["<Leader>sw"] = function()
                spectre.open_visual({ select_word = true })
            end,
            ["<Leader>st"] = spectre.toggle,
            ["<Leader>sf"] = spectre.open_file_search,
            ["<Leader>sr"] = function()
                if not state.opened then
                    spectre.open()
                end
                spectre.resume_last_search()
            end,
        },
    })
end

return M
