local alpha = require("alpha")
local startify = require("alpha.themes.startify")
local keymappings = require("kvim.keymappings")
local utils = require("utils")

local M = {}

local kvim_header = {
    "██╗  ██╗  ██╗   ██╗██╗███╗   ███╗",
    "██║ ██╔╝  ██║   ██║██║████╗ ████║",
    "█████╔╝   ██║   ██║██║██╔████╔██║",
    "██╔═██╗   ╚██╗ ██╔╝██║██║╚██╔╝██║",
    "██║  ██╗   ╚████╔╝ ██║██║ ╚═╝ ██║",
    "╚═╝  ╚═╝    ╚═══╝  ╚═╝╚═╝     ╚═╝",
}

local kvim_footer = { "Kesse Jones" }

local function startify_custom()
    local custom_header = startify.section.header
    custom_header.val = utils.center(kvim_header)
    custom_header.opts = { hl = "Title" }

    local custom_footer = startify.section.footer
    custom_footer.type = "text"
    custom_footer.val = utils.center(kvim_footer)
    custom_footer.opts = { hl = "Title" }

    local ignore_paths = { ".git/", "COMMIT_EDITMSG" }
    local mru_opts = {
        ignore = function(path, _)
            print(path)
            for _, p in ipairs(ignore_paths) do
                if string.find(path, p) then
                    return true
                end
            end
            return false
        end,
    }

    local custom_mru = {
        type = "group",
        val = {
            { type = "padding", val = 1 },
            { type = "text", val = " Recents", opts = { hl = "Statement" } },
            { type = "padding", val = 1 },
            {
                type = "group",
                val = function()
                    return { startify.mru(10, nil, nil, mru_opts) }
                end,
            },
        },
    }

    local custom_mru_cwd = {
        type = "group",
        val = {
            { type = "padding", val = 1 },
            {
                type = "text",
                val = "  Project: " .. vim.fn.getcwd(),
                opts = { hl = "Statement", shrink_margin = false },
            },
            { type = "padding", val = 1 },
            {
                type = "group",
                val = function()
                    return { startify.mru(0, vim.fn.getcwd(), nil, mru_opts) }
                end,
                opts = { shrink_margin = false },
            },
        },
    }

    local config = {
        layout = {
            { type = "padding", val = 1 },
            custom_header,
            { type = "padding", val = 2 },
            custom_mru_cwd,
            custom_mru,
            { type = "padding", val = 1 },
            custom_footer,
        },
        opts = {
            margin = 3,
            redraw_on_resize = false,
            setup = function()
                keymappings.load({
                    normal_mode = {
                        ["i"] = "<cmd>ene<CR>",
                    },
                }, 0)
            end,
        },
    }

    return config
end

function M.init()
    alpha.setup(startify_custom())
end

return M
