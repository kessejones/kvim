local git_blame_line = require("git-blame-line")
local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
    git_blame_line.setup()

    keymappings.load({
        normal_mode = {
            ["S-t"] = function()
                require("git-blame-line").toggle()
            end,
            ["<Leader>gt"] = function()
                require("git-blame-line").open_diffview()
            end,
        },
    })
end

return M
