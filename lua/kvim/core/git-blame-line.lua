local git_blame_line = require("git-blame-line")

local M = {}

function M.init()
    git_blame_line.setup()
end

return M
