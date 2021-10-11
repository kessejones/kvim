local plugin_loader = {}
local fn = vim.fn

function plugin_loader:init(opts)
    opts = opts or {}

    local compile_path = '~/.config/nvim/plugins/packer_compiled.lua'
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    local root_path = fn.stdpath('data')..'/site/pack'

    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd 'packadd packer.nvim'
    end

    local packer_ok, packer = pcall(require, 'packer')
    if not packer_ok then
        return
    end

    packer.init {
        package_root = root_path,
        compile_path = compile_path
    }

    self.packer = packer

    return self
end

function plugin_loader:load(settings)
   return self.packer.startup(function(use)
       for _, plugins in ipairs(settings) do
            for _, plugin in ipairs(plugins) do
                use(plugin)
            end
        end
   end)
end

return plugin_loader

