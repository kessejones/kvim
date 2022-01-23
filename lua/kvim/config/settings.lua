local M = {  }

local default_settings = {
    lazyredraw = true,
    smarttab = true,
    backup = false,
    clipboard = 'unnamedplus',
    hlsearch = true,
    ignorecase = true,
    showtabline = 2,
    mouse = "a",
    autoindent = true,
    background = 'dark',
    expandtab = true,
    shiftwidth = 4,
    smartindent = true,
    title = true,
    swapfile = false,
    pumheight = 10,
    tabstop = 4,
    hidden = true,
    number = true,
    relativenumber = false,
    wrap = true,
    cursorline = true,
    inccommand = 'split',
    scrolloff = 5,
    sidescrolloff = 5,
    guifont = "monospace:h17",
    wildmenu = true,
    incsearch = true,
    path = vim.o.path..'**',
    conceallevel = 0,
    list = true,
    updatetime = 300,
    timeoutlen = 300,
    ttyfast = true,
}

function M:set(key, value)
    vim.opt[key] = value
end

function M:cmd(command, argument)
    vim.cmd(command .. ' ' .. argument)
end

function M:init()
    vim.opt.shortmess:append "c"
    vim.opt.listchars:append("eol:↴")

    vim.opt.wildignore:append("**/node_modules/*")
    vim.opt.wildignore:append("**/vendor/*")
    vim.opt.wildignore:append("**/.git/*")
    vim.opt.wildignore:append("**/coverage/*")
 
    for key, value in pairs(default_settings) do 
        M:set(key, value)
    end
end

return M
