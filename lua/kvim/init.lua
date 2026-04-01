local M = {}

function M.init()
    require("kvim.plugin-manager").init()
    require("kvim.ui").init()

    require("vim._core.ui2").enable({ enable = true })
end

return M
