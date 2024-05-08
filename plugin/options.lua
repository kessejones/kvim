local function set(key, value)
    vim.opt[key] = value
end

local function set_all(values)
    for key, value in pairs(values) do
        set(key, value)
    end
end

local function append(key, values)
    for _, value in ipairs(values) do
        vim.opt[key]:append(value)
    end
end

local options = {
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
    wildmenu = true,
    incsearch = true,
    conceallevel = 0,
    list = true,
    completeopt = { "menu", "menuone", "noselect" },
    showcmd = false,
    undofile = true,
    undodir = vim.env.HOME .. "/.cache/nvim/undodir",
    termguicolors = true,
    foldmethod = "indent",
    foldlevel = 99,
}

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

append("shortmess", { "c" })
append("listchars", { "eol:↴" })
append("path", { "**" })

append("wildignore", {
    "**/node_modules/*",
    "**/vendor/*",
    "**/.git/*",
    "**/coverage/*",
    "**/code_coverage_html/*",
})

set_all(options)
