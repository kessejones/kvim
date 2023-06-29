local keymappings = require("kvim.keymappings")
local gitsigns = require("gitsigns")

local M = {}

function M.init()
    gitsigns.setup({
        current_line_blame = false,
        numhl = true,
        on_attach = function(bufnr)
            local mappigns = {
                normal_mode = {
                    ["<leader>hs"] = gitsigns.stage_hunk,
                    ["<leader>hr"] = gitsigns.reset_hun,
                    ["<leader>hS"] = gitsigns.stage_buffer,
                    ["<leader>hu"] = gitsigns.undo_stage_hunk,
                    ["<leader>hR"] = gitsigns.reset_buffer,
                    ["<leader>hp"] = gitsigns.preview_hunk,
                    ["<leader>hb"] = function()
                        gitsigns.blame_line({ full = true })
                    end,
                    ["<leader>hg"] = gitsigns.toggle_deleted,
                },
                visual_mode = {
                    ["<leader>hs"] = function()
                        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                    end,
                    ["<leader>hr"] = function()
                        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                    end,
                },
            }

            keymappings.load(mappigns, bufnr)
        end,
    })
end

return M
