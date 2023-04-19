local a = vim.api

local group = a.nvim_create_augroup("KVimTerm", {})

a.nvim_create_autocmd("TermOpen", {
    group = group,
    pattern = "term://*",
    callback = function(args)
        if vim.bo[args.buf].filetype == "" then
            local win = a.nvim_get_current_win()
            vim.wo[win].number = false
            vim.wo[win].relativenumber = false
            vim.bo[args.buf].filetype = "KVimTerm"
            vim.cmd.startinsert({ bang = true })
        end
    end,
})

a.nvim_create_user_command("TermNew", function()
    vim.cmd.vsplit()
    vim.cmd.term()
end, {})
