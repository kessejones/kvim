local M = {}

function M.init()
    vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.stdpath("data") .. "/mason/bin"

    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
            backdrop = 100,
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

    require("kvim.utils.keymap").nmap("<Leader><tab>", function()
        require("lazy").home()
    end, { desc = "Open Lazy home" })
end

return M
