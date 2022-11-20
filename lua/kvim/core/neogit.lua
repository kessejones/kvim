local neogit = require("neogit")
local keymappings = require("kvim.keymappings")

local au = vim.api.nvim_create_autocmd
local ag = vim.api.nvim_create_augroup

local M = {}

function M.init()
    neogit.setup({
        disable_commit_confirmation = true,
        disable_hint = true,
        integrations = {
            diffview = true,
        },
    })

    keymappings.load({
        normal_mode = {
            ["<Leader>gg"] = function()
                neogit.open({})
            end,
            ["<Leader>gv"] = function()
                if vim.g.kvim_diffview_opened then
                    require("diffview").close()
                else
                    require("diffview").open()
                end
            end,
            ["<Leader>gf"] = function()
                if vim.g.kvim_diffview_opened then
                    require("diffview").close()
                else
                    require("diffview").file_history()
                end
            end,
        },
    })

    ag("Kvim", {})

    au("User", {
        group = "Kvim",
        pattern = "DiffviewViewOpened",
        callback = function()
            vim.g.kvim_diffview_opened = true
        end,
    })

    au("User", {
        group = "Kvim",
        pattern = "DiffviewViewClosed",
        callback = function()
            vim.g.kvim_diffview_opened = false
        end,
    })
end

return M
