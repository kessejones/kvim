local keymappings = require("kvim.keymappings")
local util = require("lspconfig.util")

local M = {}

local function find_pattern_root()
    local patterns = {
        ".git/",
        "package.json",
        "composer.json",
        "Cargo.toml",
        "mix.exs",
        "flake.nix",
    }
    local fname = vim.fn.expand("%:p")
    return util.root_pattern(patterns)(fname) or vim.fn.getcwd()
end

function M.init()
    require("oil").setup({
        columns = {
            "icon",
        },
        keymaps = {
            ["<BS>"] = "actions.parent",
            ["<CR>"] = "actions.select",
            ["g."] = "actions.toggle_hidden",
            ["q"] = "actions.close",
            ["<Leader>tg"] = "actions.close",
            ["<Leader>tt"] = "actions.close",
            ["gc"] = {
                callback = function()
                    require("oil").open(find_pattern_root())
                end,
            },
            ["<Leader>ss"] = {
                callback = function()
                    require("oil").save({
                        confirm = false,
                    })
                end,
            },
        },
        skip_config_for_simple_edits = true,
    })

    keymappings.load({
        normal_mode = {
            ["<Leader>tg"] = function()
                local pname = vim.fn.expand("%:h")
                if pname == "" then
                    pname = find_pattern_root()
                end
                require("oil").open(pname)
            end,
            ["<Leader>tt"] = function()
                require("oil").open(find_pattern_root())
            end,
        },
    })
end

return M
