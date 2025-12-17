local nmap = require("kvim.utils.keymap").nmap

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

    return vim.fs.root(0, patterns)
end

local function get_root_dir()
    return vim.fn.getcwd()
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
            ["<C-e>"] = "actions.select_tab",
            ["<Leader>tg"] = "actions.close",
            ["<Leader>tt"] = "actions.close",
            ["gp"] = "actions.preview",
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
        skip_confirm_for_simple_edits = true,
    })

    nmap("<Leader>tg", function()
        local pname = vim.fn.expand("%:h")
        if pname == "" then
            pname = find_pattern_root()
        end
        require("oil").open(pname)
    end, { desc = "Open oil file explorer (current file dir)" })

    nmap("<Leader>tt", function()
        require("oil").open(find_pattern_root())
    end, { desc = "Open oil file explorer (root dir)" })

    nmap("<Leader>tr", function()
        require("oil").open(get_root_dir())
    end, { desc = "Open oil file explorer (root dir)" })
end

return M
