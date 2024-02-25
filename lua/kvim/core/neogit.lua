local neogit = require("neogit")
local keymappings = require("kvim.keymappings")

local M = {}

function M.init()
    neogit.setup({
        disable_hint = true,
        integrations = {
            diffview = true,
        },

        mappings = {
            finder = {
                ["<cr>"] = "Select",
                ["<c-c>"] = "Close",
                ["<esc>"] = "Close",
                ["<c-n>"] = "Next",
                ["<c-p>"] = "Previous",
                ["<c-k>"] = "Previous",
                ["<c-j>"] = "Next",
                ["<down>"] = "Next",
                ["<up>"] = "Previous",
                ["<tab>"] = "MultiselectToggleNext",
                ["<s-tab>"] = "MultiselectTogglePrevious",
            },
        },
    })
    keymappings.load({
        normal_mode = {
            ["<Leader>gg"] = function()
                require("neogit").open({})
            end,
        },
    })
end

return M
