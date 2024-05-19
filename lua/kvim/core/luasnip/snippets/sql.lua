---@diagnostic disable: undefined-global
return {
    s("select", fmt("SELECT * FROM {table}", { table = i(1, "table") })),
    s(
        "select",
        fmt(
            "SELECT * FROM {table} WHERE {field} = {value}",
            { table = i(1, "table"), field = i(2, "field"), value = i(3, "value") }
        )
    ),
    s(
        "update",
        fmt(
            "UPDATE {table} SET {column} = {value}",
            { table = i(1, "table"), column = i(2, "column"), value = i(3, "value") }
        )
    ),
}
