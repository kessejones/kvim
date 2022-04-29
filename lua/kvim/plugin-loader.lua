local M = {
    packer = nil,
    packer_bootstrap = false,
    packer_started = false,
}

local fn = vim.fn

local function download_packer()
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    return fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

local function load_packer()
    local ok, packer = pcall(require, "packer")
    if ok then
        return packer
    end
    return nil
end

function M.init()
    local packer = load_packer()
    if not packer then
        local out = download_packer()
        vim.cmd("packadd packer.nvim")
        print(out)

        packer = load_packer()
        if not packer then
            return
        end

        packer.on_complete = function()
            print("You'll need to restart now")
        end

        packer.init()
        M.packer_bootstrap = true
    end

    M.packer_started = true
    M.packer = packer
end

function M.load(list)
    return M.packer.startup({
        function(use)
            for _, plugin in pairs(list) do
                use(plugin)
            end
            if M.packer_bootstrap then
                M.packer.sync()
            end
        end,
        config = {
            display = {
                open_fn = function()
                    return require("packer.util").float({ border = "single" })
                end,
            },
        },
    })
end

return M
