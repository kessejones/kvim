local M = {}

local default_settings = {
    encoding = "utf-8",
    lazyredraw = true,
    smarttab = true,
    smartcase = true,
    backup = false,
    writebackup = false,
    clipboard = "unnamedplus",
    hlsearch = true,
    ignorecase = true,
    showtabline = 2,
    mouse = "nv",
    autoindent = true,
    background = "dark",
    expandtab = true,
    shiftwidth = 4,
    smartindent = true,
    title = false,
    swapfile = false,
    tabstop = 4,
    hidden = true,
    number = true,
    relativenumber = true,
    wrap = true,
    cursorline = true,
    inccommand = "nosplit",
    scrolloff = 10,
    sidescrolloff = 5,
    guifont = "JetBrainsMono Nerd Font:h10",
    wildmenu = true,
    incsearch = true,
    conceallevel = 0,
    list = true,
    timeoutlen = 300,
    completeopt = { "menu", "menuone", "noselect" },
    showcmd = false,
    undofile = true,
    undodir = vim.env.HOME .. "/.cache/nvim/undodir",
    termguicolors = true,
    foldmethod = "indent",
    foldlevel = 99,
}

function M.set(key, value)
    vim.opt[key] = value
end

function M.init()
    vim.opt.shortmess:append("c")
    vim.opt.listchars:append("eol:↴")
    vim.opt.path:append("**")

    vim.opt.wildignore:append("**/node_modules/*")
    vim.opt.wildignore:append("**/vendor/*")
    vim.opt.wildignore:append("**/.git/*")
    vim.opt.wildignore:append("**/coverage/*")
    vim.opt.wildignore:append("**/code_coverage_html/*")

    for key, value in pairs(default_settings) do
        M.set(key, value)
    end

    vim.g.loaded_perl_provider = 0
    vim.g.loaded_ruby_provider = 0
    vim.g.loaded_node_provider = 0
end

return M
