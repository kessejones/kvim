local M = {  }

-- define kvim global variable
function M:init() 
    require'kvim.config.settings':init()
    kvim = require'kvim.config.defaults'
end

return M
