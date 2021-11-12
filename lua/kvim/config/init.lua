local M = {  }

-- define kvim global variable
function M:init() 
    require'kvim.config.settings':init()
end

return M
