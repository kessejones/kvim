---@diagnostic disable: undefined-global
return {
    s("today", { extras.partial(os.date, "%Y-%m-%d") }),
    s("now", { extras.partial(os.date, "%Y-%m-%d %H:%M:%S") }),
    s("timestamp", { extras.partial(os.date, "%s") }),
}
