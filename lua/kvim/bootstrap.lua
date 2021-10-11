local M = { }

function M:init()
    require'kvim.config':init()
    require'kvim.plugin-loader':init()
    require'kvim.colors':init()
end

return M
