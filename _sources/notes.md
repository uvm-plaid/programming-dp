# Notes

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
\usepackage[svgnames]{xcolor}
\usepackage[,numfigreset=1,mathnumfig]{sphinx}
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
