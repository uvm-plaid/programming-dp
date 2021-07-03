jupyter-book build .
jupyter-book build --builder pdflatex .
cp static/index.html _build/html/
cp static/book-logo.png _build/html/
cp _build/latex/book.pdf _build/html/ 2>/dev/null || :
ghp-import -n -p -f _build/html
