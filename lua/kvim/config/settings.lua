local M = {  }

local default_settings = {
    ai = true,
    si = true,
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
    cursorline = true,
}

function M:set(key, value)
    vim.opt[key] = value
end

function M:cmd(command, argument)
    vim.cmd(command .. ' ' .. argument)
end

function M:init()
    vim.opt.shortmess:append "c"
    for key, value in pairs(default_settings) do 
        M:set(key, value)
    end
end

return M
