local keymappings = require("kvim.keymappings")
local M = {}

function M.init()
    local keymap_toggle = "<C-_>"
    if vim.fn.has("mac") == 1 then
        -- NOTE: ^/ is equal to ctrl+/ (hack for macos)
        keymap_toggle = "^/"
    end

    local mappings_common = {
        [keymap_toggle] = ":Commentary<CR>",
        ["<Leader>/"] = ":Commentary<CR>",
    }

    local default_mappings = {
        normal_mode = mappings_common,
        visual_mode = mappings_common,
    }

    keymappings.load(default_mappings)
end

return M
