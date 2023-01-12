local M = {
    first_load = false,
}

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
    })
end

return M