local opt = vim.opt

opt.winborder = "rounded"
opt.smartcase = true
opt.backup = false
opt.writebackup = false
opt.clipboard = "unnamedplus"
opt.showtabline = 2
opt.mouse = "nv"
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.ignorecase = true
opt.swapfile = false
opt.tabstop = 4
opt.number = true
opt.relativenumber = true
opt.wrap = true
opt.cursorline = true
opt.inccommand = "split"
opt.list = true
opt.completeopt = { "menu", "menuone", "noselect" }
opt.showcmd = false
opt.showmode = false
opt.undofile = true
opt.undodir = vim.env.HOME .. "/.cache/nvim/undodir"
opt.termguicolors = true
opt.cmdheight = 0

opt.foldmethod = "indent"
opt.foldlevel = 99
opt.foldenable = true
opt.foldtext = ""
opt.foldcolumn = "0"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

opt.shortmess:append("c")
opt.listchars:append("eol:↴")
opt.path:append("**")

opt.wildignore:append("**/node_modules/*")
opt.wildignore:append("**/vendor/*")
opt.wildignore:append("**/.git/*")
opt.wildignore:append("**/coverage/*")
opt.wildignore:append("**/code_coverage_html/*")

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
