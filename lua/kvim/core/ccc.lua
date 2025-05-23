local ccc = require("ccc")
local nmap = require("kvim.utils.keymap").nmap

local M = {}

function M.init()
    ccc.setup({})

    nmap("<Leader>cc", "<CMD>:CccPick<CR>", { desc = "Open color picker" })
end

return M
