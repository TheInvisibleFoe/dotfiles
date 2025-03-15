return {
    s({ trig = "texdoc;", snippetType = "autosnippet" },
        fmta(
            [[
                \documentclass[a4paper]{article}

                \usepackage[utf8]{inputenc}
                \usepackage[T1]{fontenc}
                \usepackage{textcomp}
                \usepackage[dutch]{babel}
                \usepackage{amsmath, amssymb}
                \usepackage{preamble}
                \usepackage{mlmodern}
                \usepackage{transparent}
                \newcommand{\incfig}[1]{%
                    \def\svgwidth{\columnwidth}
                    \import{./figures/}{#1.pdf_tex}
                }
                \pdfsuppresswarningpagegroup=1
                \title{<>}
                \begin{document}
                \maketitle
                    <>
                \end{document}
        ]],
            {
                i(1),
                i(2),
            }
        )
    ),
    s({ trig = ":st", snippetType = "autosnippet" },
        fmta(
            [[
                \section{<>}
                <>
            ]]
            ,
            {
                i(1),
                i(2),
            }

        )
    ),
    s({ trig = ":sst", snippetType = "autosnippet" },
        fmta(
            [[
                \subsection{<>}
                <>
            ]]
            ,
            {
                i(1),
                i(2),
            }

        )
    ),
    s({ trig = ":ssst", snippetType = "autosnippet" },
        fmta(
            [[
                \subsubsection{<>}
                <>
            ]]
            ,
            {
                i(1),
                i(2),
            }

        )
    ),
}
