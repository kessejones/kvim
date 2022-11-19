local keymappings = require("kvim.keymappings")
local gitsigns = require("gitsigns")

local M = {}

function M.init()
    gitsigns.setup({
        current_line_blame = false,
        on_attach = function(bufnr)
            local mappigns = {
                normal_mode = {
                    ["<Leader>,s"] = gitsigns.stage_hunk,
                    ["<Leader>,u"] = gitsigns.undo_stage_hunk,
                    ["<Leader>,r"] = gitsigns.reset_buffer,
                    ["<Leader>,d"] = gitsigns.diffthis,
                    ["<Leader>,b"] = function()
                        gitsigns.blame_line({ full = true })
                    end,
                    ["<Leader>,t"] = gitsigns.toggle_deleted,
                },
                visual_mode = {
                    ["<Leader>,s"] = gitsigns.stage_hunk,
                    ["<Leader>,r"] = gitsigns.reset_hunk,
                },
            }

            keymappings.load(mappigns, bufnr)
        end,
    })
end

return M
