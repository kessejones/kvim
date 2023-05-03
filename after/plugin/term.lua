local a = vim.api

local group = a.nvim_create_augroup("KVimTerm", {})

a.nvim_create_autocmd("TermOpen", {
    group = group,
    pattern = "term://*",
    callback = function(args)
        if vim.bo[args.buf].filetype == "" then
            vim.cmd.setlocal("nonumber")
            vim.cmd.setlocal("norelativenumber")

            vim.bo[args.buf].filetype = "KVimTerm"
            vim.cmd.startinsert({ bang = true })
        end
    end,
})

local function term_command_run(opts)
    local kind = opts.fargs[1]
    if kind == "horizontal" or not kind then
        vim.cmd.split({ mods = { split = "botright" } })
    elseif kind == "vertical" then
        vim.cmd.split({ mods = { vertical = true, split = "topleft" } })
    elseif kind == "tab" then
        vim.cmd.tabnew()
    end
    vim.cmd.term()
end

local function term_command_complete(_, line, _)
    local input = vim.fn.trim(line)

    if #(vim.split(input, " ")) > 1 then
        return {}
    end

    return { "vertical", "horizontal", "tab" }
end

a.nvim_create_user_command("Term", term_command_run, {
    nargs = "*",
    range = true,
    complete = term_command_complete,
})
