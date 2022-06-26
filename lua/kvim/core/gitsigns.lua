local keymappings = require("kvim.keymappings")
local gitsigns = require("gitsigns")

local M = {}

function M.init()
    gitsigns.setup({
        current_line_blame = false,
        on_attach = function(bufnr)
            local mappigns = {
                normal_mode = {
                    ["<Leader>hs"] = gitsigns.stage_hunk,
                    ["<Leader>hu"] = gitsigns.undo_stage_hunk,
                    ["<Leader>hd"] = gitsigns.diffthis,
                    ["<Leader>hR"] = gitsigns.reset_buffer,
                    ["<Leader>hb"] = function()
                        gitsigns.blame_line({ full = true })
                    end,
                    ["<Leader>td"] = gitsigns.toggle_deleted,
                },
                visual_mode = {
                    ["<Leader>hs"] = gitsigns.stage_hunk,
                    ["<Leader>hr"] = gitsigns.reset_hunk,
                },
            }

            keymappings.load(mappigns, bufnr)
        end,
    })
end

return M
