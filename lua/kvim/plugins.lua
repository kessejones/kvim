local plugins_group = vim.api.nvim_create_augroup("kvim-plugins", { clear = true })

local function pack_hook(ev)
    local kind = ev.data.kind
    local name = ev.data.spec.name
    local data = (ev.data.spec.data or {})
    local build = data.build

    if (kind == "update" or kind == "install") and build ~= nil then
        vim.notify("Building plugin " .. name)

        if type(build) == "string" then
            vim.cmd(build)
            vim.notify("Build plugin " .. name .. ": Done")
        elseif type(build) == "function" then
            build()
            vim.notify("Build plugin " .. name .. ": Done")
        elseif type(build) == "table" then
            local output = vim.system(build, {
                cwd = ev.data.path,
                text = true,
            }):wait()

            if output.code == 0 then
                vim.notify(output.stdout)
            else
                vim.notify(output.stderr, vim.log.levels.ERROR)
            end

            vim.notify("Build plugin " .. name .. ": Done")
        else
            vim.notify("Invalid type of build parameter for plugin " .. name, vim.log.levels.ERROR)
        end
    end
end

local function gh(repo)
    return "https://github.com/" .. repo
end

local function load_plugin(plug_data)
    local data = plug_data.spec.data or {}
    local name = plug_data.spec.name
    vim.cmd.packadd(name)

    local init = data.init
    if init and type(init) == "function" then
        init()
    end
end

local function load_hook(plug_data)
    local data = plug_data.spec.data or {}
    local filetypes = data.filetypes or {}
    local keys = data.keys or {}
    local cmds = data.cmds or {}
    local events = data.events or {}

    local should_load = true
    local events_id = {}

    local function registers_keys(_keys, callback)
        for _, key in ipairs(_keys) do
            vim.keymap.set("n", key, function()
                callback(key)
            end)
        end
    end

    local function unregisters_keys()
        for _, k in ipairs(keys) do
            vim.keymap.del("n", k, {})
        end
    end

    local function unregisters_events()
        for _, id in ipairs(events_id) do
            vim.api.nvim_del_autocmd(id)
        end
    end

    local function unregister_cmds()
        for _, c in ipairs(cmds) do
            vim.api.nvim_del_user_command(c)
        end
    end

    local function flush()
        unregisters_keys()
        unregister_cmds()
        unregisters_events()
    end

    if #keys > 0 then
        should_load = false

        registers_keys(keys, function(key)
            flush()
            load_plugin(plug_data)

            vim.schedule(function()
                vim.api.nvim_input(vim.api.nvim_replace_termcodes(key, true, false, true))
            end)
        end)
    end

    if #filetypes > 0 then
        should_load = false
        local id = vim.api.nvim_create_autocmd("FileType", {
            group = plugins_group,
            pattern = filetypes,
            callback = function()
                load_plugin(plug_data)
                flush()
            end,
        })

        table.insert(events_id, id)
    end

    if #cmds > 0 then
        should_load = false
        for _, c in ipairs(cmds) do
            vim.api.nvim_create_user_command(c, function()
                load_plugin(plug_data)
                flush()

                vim.cmd(c)
            end, {})
        end
    end

    if #events > 0 then
        should_load = false
        for _, event in ipairs(events) do
            local id = vim.api.nvim_create_autocmd(event, {
                group = plugins_group,
                callback = function()
                    load_plugin(plug_data)
                    flush()
                end,
            })

            table.insert(events_id, id)
        end
    end

    if should_load then
        load_plugin(plug_data)
    end
end

vim.api.nvim_create_autocmd("PackChanged", {
    callback = pack_hook,
})

vim.api.nvim_create_user_command("PackUpdate", function()
    vim.pack.update()
end, {})

vim.pack.add({
    {
        src = gh("catppuccin/nvim"),
        name = "catppuccin",
        data = {
            init = function()
                require("kvim.core.catppuccin")
            end,
        },
    },
    gh("nvim-tree/nvim-web-devicons"),

    { src = gh("nvim-treesitter/nvim-treesitter-textobjects"), branch = "main" },
    gh("chrisgrieser/nvim-various-textobjs"),
    {
        src = gh("nvim-treesitter/nvim-treesitter"),
        branch = "main",
        data = {
            build = function()
                vim.cmd.TSUpdate()
            end,
            init = function()
                require("kvim.core.treesitter")
            end,
        },
    },

    gh("nvim-lua/plenary.nvim"),

    {
        src = gh("akinsho/bufferline.nvim"),
        data = {
            init = function()
                require("kvim.core.bufferline")
            end,
        },
    },

    {
        src = gh("saghen/blink.cmp"),
        version = vim.version.range("v1.*"),
        data = {
            build = (function()
                if vim.fn.executable("nixos-version") == 1 then
                    return { "nix", "run", ".#build-plugin" }
                end

                return { "cargo", "build", "--release" }
            end)(),
            init = function()
                require("kvim.core.blink")
            end,
        },
    },
    {
        src = gh("L3MON4D3/LuaSnip"),
        version = vim.version.range("v2.*"),
        data = {
            build = { "make", "install_jsregexp" },
            init = function()
                require("kvim.core.luasnip")
            end,
        },
    },

    {
        src = gh("stevearc/oil.nvim"),
        data = {
            keys = { "<Leader>tt", "<Leader>tg" },
            init = function()
                require("kvim.core.oil")
            end,
        },
    },

    -- gh("kristijanhusak/vim-dadbod-completion"),
    -- gh("kristijanhusak/vim-dadbod-ui"),
    -- {
    --     src = gh("tpope/vim-dadbod"),
    --     data = {
    --         init = function()
    --             require("kvim.core.vim-dadbod").init()
    --         end,
    --     },
    -- },

    gh("j-hui/fidget.nvim"),
    {
        src = gh("folke/flash.nvim"),
        data = {
            keys = {
                "f",
                "F",
                "ss",
                "se",
                "sa",
                "st",
                "sz",
            },
            init = function()
                require("kvim.core.flash")
            end,
        },
    },
    {
        src = gh("sindrets/diffview.nvim"),
        data = {
            cmds = { "DiffviewOpen" },
            keys = { "<Leader>hd", "<Leader>hD" },
            init = function()
                require("kvim.core.diffview")
            end,
        },
    },
    {
        src = gh("kessejones/git-blame-line.nvim"),
        data = {
            keys = { "T" },
            init = function()
                require("kvim.core.git-blame-line")
            end,
        },
    },

    {
        src = gh("NeogitOrg/neogit"),
        data = {
            keys = { "<Leader>gg" },
            init = function()
                require("kvim.core.neogit")
            end,
        },
    },
    {
        src = gh("akinsho/git-conflict.nvim"),
        data = {
            cmds = { "GitConflictListQf" },
            init = function()
                require("git-conflict").setup()
            end,
        },
    },
    {
        src = gh("lewis6991/gitsigns.nvim"),
        data = {
            init = function()
                require("kvim.core.gitsigns")
            end,
        },
    },

    {
        src = gh("MagicDuck/grug-far.nvim"),
        data = {
            cmds = { "GrugFar" },
            keys = { "<Leader>/r" },
            init = function()
                require("kvim.core.grug-far")
            end,
        },
    },

    {
        src = gh("mistweaverco/kulala.nvim"),
        data = {
            filetypes = { "http" },
            init = function()
                require("kvim.core.kulala")
            end,
        },
    },
    {
        src = gh("nvim-lualine/lualine.nvim"),
        data = {
            init = function()
                require("kvim.core.lualine")
            end,
        },
    },
    {
        src = gh("williamboman/mason.nvim"),
        data = {
            cmds = { "Mason", "MasonInstall" },
            init = function()
                require("kvim.core.mason")
            end,
        },
    },

    {
        src = gh("nvim-mini/mini.splitjoin"),
        data = {
            keys = { "gS" },
            init = function()
                require("mini.splitjoin").setup()
            end,
        },
    },

    {
        src = gh("brenton-leighton/multiple-cursors.nvim"),
        data = {
            keys = { "<C-S-K>", "<C-S-J>", "<C-n>l", "<C-n>a", "<C-n>n" },
            init = function()
                require("kvim.core.multi-cursor")
            end,
        },
    },
    {
        src = gh("nvimtools/none-ls.nvim"),
        data = {
            init = function()
                require("kvim.core.none-ls")
            end,
        },
    },

    {
        src = gh("windwp/nvim-autopairs"),
        data = {
            init = function()
                require("kvim.core.nvim-autopairs")
            end,
        },
    },

    gh("stevearc/quicker.nvim"),
    {
        src = gh("folke/snacks.nvim"),
        data = {
            init = function()
                require("kvim.core.snacks")
            end,
        },
    },
    {
        src = gh("uga-rosa/ccc.nvim"),
        data = {
            cmds = { "CccPick" },
            init = function()
                require("ccc").setup()
            end,
        },
    },

    {
        src = gh("kessejones/term.nvim"),
        data = {
            keys = { "<Leader>;" },
            init = function()
                require("kvim.core.term")
            end,
        },
    },
}, { load = load_hook, confirm = false })
