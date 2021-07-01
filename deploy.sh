jupyter-book build .
cp static/index.html _build/html/
cp static/book-logo.png _build/html/
cp book.pdf _build/html/ 
ghp-import -n -p -f _build/html
