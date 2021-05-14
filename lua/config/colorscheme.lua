local cmd = vim.cmd
local has = vim.fn.has

vim.g.tokyonight_style = "night"
vim.g.tokyonight_enable_italic = true

if not has('mac') then
    cmd [[set termguicolors]]
end

cmd [[colorscheme tokyonight]]
