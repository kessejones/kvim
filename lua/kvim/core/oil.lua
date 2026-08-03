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

local function nmap(lhs, rhs, opts)
    opts = opts or {}
    vim.keymap.set("n", lhs, rhs, opts)
end

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
        ["<C-c>"] = {
            callback = function()
                require("oil").discard_all_changes()
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

local augroup = vim.api.nvim_create_augroup("KvimOil", { clear = true })

vim.api.nvim_create_autocmd("User", {
    pattern = "OilActionsPost",
    group = augroup,
    callback = function(e)
        if e.data.actions == nil then
            return
        end
        for _, action in ipairs(e.data.actions) do
            if action.entry_type == "file" and action.type == "delete" then
                local file = action.url:sub(7)
                local bufnr = vim.fn.bufnr(file)

                if bufnr >= 0 then
                    vim.api.nvim_buf_delete(bufnr, { force = true })
                end
            end
        end
    end,
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
