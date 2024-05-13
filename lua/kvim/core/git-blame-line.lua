local git_blame_line = require("git-blame-line")
local nmap = require("kvim.utils.keymap").nmap

local M = {}

function M.init()
    git_blame_line.setup()

    nmap("<S-t>", function()
        git_blame_line.toggle()
    end, { desc = "Toggle git blame current line" })

    nmap("<Leader>gt", function()
        git_blame_line.open_diffview()
    end, { desc = "Open diffview for current line" })
end

return M
