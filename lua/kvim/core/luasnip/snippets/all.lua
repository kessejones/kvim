---@diagnostic disable: undefined-global
return {
    s("@today", { extras.partial(os.date, "%Y-%m-%d") }),
    s("@now", { extras.partial(os.date, "%Y-%m-%d %H:%M:%S") }),
    s("@timestamp", { extras.partial(os.date, "%s") }),
    s("@todo", fmt("// TODO: {comment}", { comment = i(1, "") })),
    s("@fix", fmt("// FIXME: {comment}", { comment = i(1, "") })),
    s("@note", fmt("// NOTE: {comment}", { comment = i(1, "") })),
}
