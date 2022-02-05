local keymappings = require("kvim.keymappings")

local M = {}

function M:init()
    keymappings:load({
        normal_mode = {
            ["<Leader>gg"] = ":G<CR>",
            ["<Leader>gc"] = ":G commit<CR>",
            ["<Leader>gs"] = ":G stash<CR>",
            ["<Leader>gd"] = ":G diff<CR>",
            ["<Leader>gpl"] = ":G pull<CR>",
            ["<Leader>gps"] = ":G push<CR>",
        },
    })
end

return M
