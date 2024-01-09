-- Place this in ${HOME}/.config/nvim/LuaSnip/all.lua
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
return {
    -- A snippet that expands the trigger "hi" into the string "Hello, world!".
    s(
        { "hi" },
        { t("Hello, world!") }
    ),

    -- To return multiple snippets, use one `return` statement per snippet file
    -- and return a table of Lua snippets.
    s(
        { trig = "foo" },
        { t("Another snippet.") }
    ),
    -- The Latex Snippets reqd
    s(
        { trig = ";a" },
        { t("\alpha") }
    ),
    -- Examples of Greek letter snippets, autotriggered for efficiency
    -- s({ trig = "ga", snippetType = "autosnippet" },
    --     {
    --         t("\\alpha"),
    --     }
    -- ),
    -- s({ trig = ";b", snippetType = "autosnippet" },
    --     {
    --         t("\\beta"),
    --     }
    -- ),
    -- s({ trig = ";g", snippetType = "autosnippet" },
    --     {
    --         t("\\gamma"),
    --     }
    -- ),
}
