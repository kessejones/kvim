local M = {}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

function M.init(opts)
    opts = opts or {}

    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end

    vim.opt.rtp:prepend(lazypath)

    M.load()
end

function M.load()
    require("lazy").setup("kvim.plugins", {
        ui = {
            border = "rounded",
        },
        change_detection = {
            enabled = false,
            notify = false,
        },
        install = {},
        checker = { enabled = false },
        performance = {
            rtp = {
                disabled_plugins = {
                    "gzip",
                    "zip",
                    "zipPlugin",
                    "tar",
                    "tarPlugin",
                    "vimball",
                    "vimballPlugin",
                    "matchit",
                    "matchparen",
                    "logiPat",
                    "rrhelper",
                    "netrw",
                    "netrwFileHandlers",
                    "netrwPlugin",
                    "netrwSettings",
                    "tutor_mode_plugin",
                    "getscript",
                    "getscriptPlugin",
                    "2html_plugin",
                    "tohtml",
                    "tutor",
                },
            },
        },
    })

    require("kvim.keymappings").load({
        normal_mode = {
            ["<Leader><tab>"] = function()
                require("lazy").home()
            end,
        },
    })
end

return M
