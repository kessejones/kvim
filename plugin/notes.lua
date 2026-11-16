local ts = vim.treesitter
local treesitter = require("nvim-treesitter")

local group = vim.api.nvim_create_augroup("kvim_notes", { clear = true })
local ns = vim.api.nvim_create_namespace("kvim_notes")

local query_note = [[
((comment) @comment
  (#lua-match? @comment "^%-%-%s*%@[a-zA-Z]+"))

((comment) @comment
  (#lua-match? @comment "^%/%/%s*%@[a-zA-Z]+"))

((comment) @comment
  (#lua-match? @comment "^%;%s*%@[a-zA-Z]+"))
]]

local query_todos = [[
((comment) @comment
  (#lua-match? @comment "^%-%-%s*TODO%s*"))
((comment) @comment
  (#lua-match? @comment "^%/%/%s*TODO%s*"))

((comment) @comment
  (#lua-match? @comment "^%-%-%s*FIXME%s*"))
((comment) @comment
  (#lua-match? @comment "^%/%/%s*FIXME%s*"))

((comment) @comment
  (#lua-match? @comment "^%-%-%s*NOTE%s*"))
((comment) @comment
  (#lua-match? @comment "^%/%/%s*NOTE%s*"))
]]

local todo_hl = {
    ["TODO"] = "@comment.todo",
    ["NOTE"] = "@comment.note",
    ["FIXME"] = "@comment.error",
}

local function hi(buf, hl, line, col, end_col)
    vim.api.nvim_buf_set_extmark(buf, ns, line, col, {
        end_col = end_col,
        hl_group = hl,
    })
end

local function hi_note(buf, line, col, end_col)
    hi(buf, "@kvim.note", line, col, end_col)
end

local function match_one(text)
    local patterns = {
        "^%s*TODO:*",
        "^%s*NOTE:*",
        "^%s*FIXME:*",
    }

    for _, pattern in ipairs(patterns) do
        local pstart, pend = text:find(pattern)
        if pstart then
            return pstart, pend
        end
    end
    return nil
end

local function get_parser_lang(buf)
    local parser = ts.get_parser(buf)
    if not parser then
        return nil
    end

    local lang = ts.language.get_lang(vim.bo[buf].filetype)
    if not lang then
        return nil
    end

    return parser, lang
end

local function apply_notes(parser, lang, buf)
    local query = vim.treesitter.query.parse(lang, query_note)
    local tree = parser:parse(false)[1]

    for _id, node, _metadata, _match in query:iter_captures(tree:root(), buf) do
        if node:type() == "comment" then
            local content = node:field("content")[1]
            local text = ts.get_node_text(content, buf)
            local pstart, pend = text:find("^%s*%@[a-zA-Z]+")

            local line, col, _ = content:start()
            hi_note(buf, line, col + pstart, col + pend)
        end
    end
end

local function apply_todos(parser, lang, buf)
    local query = vim.treesitter.query.parse(lang, query_todos)
    local tree = parser:parse(false)[1]

    for _id, node, _metadata, _match in query:iter_captures(tree:root(), buf) do
        if node:type() == "comment" then
            local content = node:field("content")[1]
            local text = ts.get_node_text(content, buf)
            local pstart, pend = match_one(text)
            if pstart then
                local mode = vim.trim(text:sub(pstart, pend))
                local h = todo_hl[mode]
                if h then
                    local line, col, _ = content:start()
                    hi(buf, h, line, col + pstart, col + pend)
                end
            end
        end
    end
end

local function invalid(buf)
    if not vim.treesitter.highlighter.active[buf] then
        return
    end

    vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
end

local function update(buf)
    if not vim.treesitter.highlighter.active[buf] then
        return
    end

    local parser, lang = get_parser_lang(buf)
    if parser and lang then
        apply_notes(parser, lang, buf)
        apply_todos(parser, lang, buf)
    end
end

---@param buf integer
local function attach(buf)
    vim.api.nvim_create_autocmd("InsertEnter", {
        group = group,
        buf = buf,
        callback = function(args)
            invalid(args.buf)
        end,
    })

    vim.api.nvim_create_autocmd("BufModifiedSet", {
        group = group,
        buf = buf,
        callback = function(args)
            invalid(args.buf)
            update(args.buf)
        end,
    })

    update(buf)
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = treesitter.get_installed(),
    callback = function(args)
        attach(args.buf)
    end,
})
