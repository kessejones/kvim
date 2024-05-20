local M = {}

function M.init()
    require("kvim.plugin-manager").init()
    require("kvim.ui").init()
    require("kvim.filetypes").init()
end

return M
