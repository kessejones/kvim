local neogit = require("neogit")
local nmap = require("kvim.utils.keymap").nmap

local M = {}

function M.init()
    neogit.setup({
        disable_hint = true,
        auto_show_console = false,
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

    nmap("<Leader>gg", function()
        require("neogit").open({})
    end, { desc = "Open neogit" })
end

return M
