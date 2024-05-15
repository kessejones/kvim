local keymap = require("kvim.utils.keymap")
local nmap = keymap.nmap
local tmap = keymap.tmap

local term = require("term")

local M = {}

function M.init()
    term.setup({
        width = 0.9,
        height = 0.9,
        position = "center",
    })

    nmap("<Leader>;", term.toggle, { desc = "Toggle terminal" })

    vim.api.nvim_create_autocmd("TermOpen", {
        callback = function(args)
            if vim.bo[args.buf].filetype == "Term" then
                tmap("<Leader>;", term.toggle, { desc = "Toggle terminal", buffer = args.buf })
                tmap("<C-n>", term.next, { desc = "Go to next terminal", buffer = args.buf })
                tmap("<C-p>", term.prev, { desc = "Go to next terminal", buffer = args.buf })
                tmap("<C-o>", term.new, { desc = "Open new terminal", buffer = args.buf })
            end
        end,
    })
end

return M
