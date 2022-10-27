# build cn book
echo "# build cn book"
jupyter-book build zh_cn/notebooks
jupyter-book build --builder pdflatex zh_cn/notebooks

# build en book
echo "# build en book"
jupyter-book build notebooks
jupyter-book build --builder pdflatex notebooks

# cp cn assets
echo "# cp cn assets"
mkdir -p _build/html/cn
cp -R zh_cn/_build/html/*  _build/html/cn/
cp zh_cn/_build/latex/cn_book.pdf _build/html/cn 2>/dev/null || :

# cp en assets
echo "# cp en assets"
cp static/index.html _build/html/
cp static/book-logo.png _build/html/
cp static/CNAME _build/html/
cp _build/latex/book.pdf _build/html/ 2>/dev/null || :

# deploy book
echo "# deploy book"
ghp-import -n -p -f _build/html
