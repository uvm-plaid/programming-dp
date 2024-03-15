# Programming Differential Privacy

This is the source repository for the book "Programming Differential Privacy." You can find the book online [here!](https://programming-dp.com/).

# Build Notes

To build the book:

```
jupyter-book build .
```

To publish the html:

```
ghp-import -n -p -f _build/html
```

To generate latex:

```
jupyter-book build . --builder latex
```

To get decent latex output, add this:

```
\PassOptionsToPackage{svgnames}{xcolor}
...
\sphinxsetup{%
  verbatimwithframe=false,
  VerbatimColor={named}{OldLace},
  TitleColor={named}{DarkGoldenrod},
  hintBorderColor={named}{LightCoral},
  attentionborder=3pt,
  attentionBorderColor={named}{Crimson},
  attentionBgColor={named}{FloralWhite},
  noteborder=2pt,
  noteBorderColor={named}{Olive},
  cautionborder=3pt,
  cautionBorderColor={named}{Cyan},
  cautionBgColor={named}{LightCyan}}
```

Or:

```
\PassOptionsToPackage{svgnames}{xcolor}
...
\sphinxsetup{%
%  verbatimwithframe=false,
  VerbatimColor={named}{Ivory},
  TitleColor={named}{DarkGoldenrod},
  hintBorderColor={named}{LightCoral},
  attentionborder=3pt,
  attentionBorderColor={named}{Crimson},
  attentionBgColor={named}{FloralWhite},
  noteborder=2pt,
  noteBorderColor={named}{Olive},
  cautionborder=3pt,
  cautionBorderColor={named}{Cyan},
  cautionBgColor={named}{LightCyan}}
\setkeys{Gin}{width=.60\csname Gin@nat@width\endcsname,keepaspectratio}
```

And also:

```
    \makeatletter
    \usepackage{ifthen}
    \usepackage{tcolorbox}
    \tcbuselibrary{skins}
    \renewenvironment{sphinxadmonition}[2]
    {
       %Green colored box for Conditions
       \ifthenelse{\equal{#2}{Conditions}}{
                         \medskip
                         \begin{tcolorbox}[before={}, enhanced, colback=green!10, 
                                           colframe=green!65!black,fonttitle=\bfseries,
                                           title=\sphinxstrong{#2}, arc=0mm, drop fuzzy shadow=blue!50!black!50!white]}{

           %Blue colored box for Notes
           \ifthenelse{\equal{#2}{Note:}}{
                             \medskip
                             \begin{tcolorbox}[before={}, enhanced, colback=blue!5!white, 
                                               colframe=blue!75!black,fonttitle=\bfseries,
                                               title=\sphinxstrong{#2}, arc=0mm, drop fuzzy shadow=blue!50!black!50!white]}{
               %Orange colored box for Warnings 
               \ifthenelse{\equal{#2}{Warning:}}{
                             \medskip
                             \begin{tcolorbox}[before={}, enhanced, colback=orange!5!white, 
                                               colframe=orange!75!black,fonttitle=\bfseries,
                                               title=\sphinxstrong{#2}, arc=0mm, drop fuzzy shadow=blue!50!black!50!white]}{

                   %Red colored box for everthing else
                   \medskip
                   \begin{tcolorbox}[before={}, enhanced, colback=red!5!white, 
                                 colframe=red!75!black, fonttitle=\bfseries,
                                 title=\sphinxstrong{#2}, arc=0mm, drop fuzzy shadow=blue!50!black!50!white]}
           }
       }
    }
    {
       \end{tcolorbox}\par\bigskip
    } 

    \makeatother
```
