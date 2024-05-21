local M = {}

function M.init()
    require("kvim.plugin-manager").init()
    require("kvim.ui").init()
end

return M
