local tex_utils = {}
tex_utils.in_mathzone = function() -- math context detection
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex_utils.in_text = function()
    return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function() -- comment detection
    return vim.fn['vimtex#syntax#in_comment']() == 1
end
tex_utils.in_env = function(name) -- generic environment detection
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_equation = function() -- equation environment detection
    return tex_utils.in_env('equation')
end
tex_utils.in_itemize = function() -- itemize environment detection
    return tex_utils.in_env('itemize')
end
tex_utils.in_tikz = function() -- TikZ picture environment detection
    return tex_utils.in_env('tikzpicture')
end


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

    s({ trig = "maxwell", snippetType = "autosnippet" },
        fmta(
            [[
            \begin{align*}
                \div{\vb{E}} &= \frac{\rho}{\epsilon_0}\\
                \div{\vb{B}} &= 0 \\
                \curl{\vb{E}} &= -\pdv{\vb{E}}{t}\\
                \curl{\vb{B}} &= \mu_0 \vb{J}+\frac{1}{c^2} \pdv{\vb{B}}{t}
            \end{align*}
            <>
        ]],
            { i(1) }
        )
    ),
    s({ trig = ">>", snippetType = "autosnippet" },
        {
            t("\\rightarrow "),
        }
    ),

    s({ trig = "gdd", snippetType = "autosnippet" },
        {
            t("\\grad "),
        },
        { condition = tex_utils.in_mathzone }
    ),
    -- CURL OPERATOR, i.e. \curl
    s({ trig = "cll", snippetType = "autosnippet" },
        {
            t("\\curl "),
        },
        { condition = tex_utils.in_mathzone }
    ),
    -- DIVERGENCE OPERATOR, i.e. \divergence
    s({ trig = "DI", snippetType = "autosnippet" },
        {
            t("\\div "),
        },
        { condition = tex_utils.in_mathzone }
    ),
    -- LAPLACIAN OPERATOR, i.e. \laplacian
    s({ trig = "laa", snippetType = "autosnippet" },
        {
            t("\\laplacian "),
        },
        { condition = tex_utils.in_mathzone }
    ),
    -- Auto environment
    s({ trig = "env", snippetType = "autosnippet" },
        fmta(
            [[
              \begin{<>}
                <>
              \end{<>}
            ]],
            {
                i(1),
                i(2),
                rep(1),
            }
        )
    ),

    -- Function mapping from R to R
    s({ trig = "rfunc", snippetType = "autosnippet" },
        { t("Let $f:\\mathbb{R}\\rightarrow\\mathbb{R}$"), }
    ),
    -- Some Sum, integral, limit, union, and intersection
    s({ trig = "isum", snippetType = "autosnippet" },
        fmta(
            [[
                \sum_{i=1}^{\infty}<>
            ]],
            {
                i(1),
            }
        )
    ),
    s({ trig = "nsum", snippetType = "autosnippet" },
        fmta(
            [[
                \sum_{i=1}{n}<>
            ]],
            {
                i(1),
            }
        )
    ),
    s({ trig = "intg", snippetType = "autosnippet" },
        fmta(
            [[
                \int_{<>}{<>}\dx
            ]],
            {
                i(1),
                i(2),
            }
        )
    ),
    -- limit with variable x and tending to a
    s({ trig = "alim", snippetType = "autosnippet" },
        fmta(
            [[
                \lim_{x \rightarrow <>}<>
            ]],
            {
                i(1),
                i(2),
            }
        )
    ),
    -- limit with variable being x and point being \infty
    s({ trig = "ilim", snippetType = "autosnippet" },
        fmta(
            [[
                \lim_{x \rightarrow \infty}<>
            ]],
            {
                i(1),
            }
        )
    ),
    s({ trig = "nlim", snippetType = "autosnippet" },
        fmta(
            [[
                \lim_{n \rightarrow \infty}<>
            ]],
            {
                i(1),
            }
        )
    ),
    s({ trig = "icup", snippetType = "autosnippet" },
        fmta(
            [[
                \bigcup_{i=1}{\infty}<>
            ]],
            {
                i(1),
            }
        )
    ),
    s({ trig = "ncup", snippetType = "autosnippet" },
        fmta(
            [[
                \bigcup_{i=1}{<>}<>
            ]],
            {
                i(1),
                i(2),
            }
        )
    ),
    s({ trig = "icap", snippetType = "autosnippet" },
        fmta(
            [[
                \bigcap_{i=1}{\infty}<>
            ]],
            {
                i(1),
            }
        )
    ),
    s({ trig = "ncap", snippetType = "autosnippet" },
        fmta(
            [[
                \bigcap_{i=1}{<>}<>
            ]],
            {
                i(1),
                i(2),
            }
        )
    ),
}
