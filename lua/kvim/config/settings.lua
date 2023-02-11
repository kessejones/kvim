local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local M = {}

local default_settings = {
    encoding = "utf-8",
    lazyredraw = true,
    smarttab = true,
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
    relativenumber = false,
    wrap = true,
    cursorline = true,
    inccommand = "nosplit",
    scrolloff = 10,
    sidescrolloff = 5,
    guifont = "monospace:h17",
    wildmenu = true,
    incsearch = true,
    conceallevel = 0,
    list = true,
    timeoutlen = 300,
    completeopt = { "menu", "menuone", "noselect" },
    showcmd = false,
    undofile = true,
    undodir = os.getenv("HOME") .. "/.cache/nvim/undodir",
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

    local yank_group = augroup("HighlightYank", {})
    autocmd("TextYankPost", {
        group = yank_group,
        pattern = "*",
        callback = function()
            vim.highlight.on_yank({
                timeout = 90,
            })
        end,
    })
end

return M
