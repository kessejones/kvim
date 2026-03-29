vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_gzip = 1

-- NOTE: experimental
require("vim._core.ui2").enable({ enable = true })

-- require("kvim.plugin-manager").init()
-- NOTE: Testing native package manager
require("kvim.plugins")

require("kvim.ui")
