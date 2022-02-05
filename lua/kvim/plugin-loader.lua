local M = {
    packer = nil,
    packer_bootstrap = false,
    packer_is_first_start = false,
}

local fn = vim.fn

function M:init(opts)
    opts = opts or {}

    local compile_path = "~/.config/nvim/plugins/packer_compiled.lua"
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    local root_path = fn.stdpath("data") .. "/site/pack"

    if fn.empty(fn.glob(install_path)) > 0 then
        self.packer_is_first_start = not fn.empty(
            fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
        )
    end

    local packer_ok, packer = pcall(require, "packer")
    if not packer_ok then
        return
    end

    packer.init({
        package_root = root_path,
        compile_path = compile_path,
    })

    self.packer_bootstrap = true
    self.packer = packer
end

function M:load(list)
    if not self.packer_bootstrap then
        error("Packer not started")
        return
    end

    return self.packer.startup({
        function(use)
            for _, plugin in pairs(list) do
                use(plugin)
            end
            if self.packer_is_first_start then
                self.packer.sync()
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
