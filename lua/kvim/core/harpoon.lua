local M = {}

function M.init()
    require("harpoon").setup()

    require("kvim.keymappings").load({
        normal_mode = {
            ["tl"] = require("harpoon.ui").nav_next,
            ["th"] = require("harpoon.ui").nav_prev,
            ["ta"] = require("harpoon.mark").add_file,
            ["tt"] = require("harpoon.ui").toggle_quick_menu,
        },
    })
end

return M
