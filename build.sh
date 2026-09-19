#!/usr/bin/env bash
# Build both books (html + pdf) and assemble the site in _site/:
#   /      english book, landing page, book.pdf
#   /cn/   chinese book, landing page, cn_book.pdf
# Executed notebook outputs are cached in */_build/execute, so only changed notebooks re-run.
set -euo pipefail
cd "$(dirname "$0")"
[ -d .venv ] && export PATH="$PWD/.venv/bin:$PATH"
ROOT=$PWD
SITE=$ROOT/_site

# no browser/server prompts; fail on build errors
export CI=1
FLAGS="--execute --strict --ci"

# CJK fonts for the chinese notebooks' plots (once, not per notebook: it rewrites matplotlib's cache dir)
mplfonts init > /dev/null

echo "# build en book"
(cd notebooks && jupyter-book build --html --pdf $FLAGS)

echo "# build cn book"
(cd zh_cn/notebooks && BASE_URL=/cn jupyter-book build --html --pdf $FLAGS)

echo "# assemble site"
rm -rf "$SITE"
cp -R notebooks/_build/html "$SITE"
cp -R zh_cn/notebooks/_build/html "$SITE/cn"
cp static/index.html static/book-logo.png static/CNAME "$SITE/"
cp notebooks/exports/book.pdf "$SITE/"
cp zh_cn/static/index.html zh_cn/static/book-logo.png "$SITE/cn/"
cp zh_cn/notebooks/exports/cn_book.pdf "$SITE/cn/"

# redirect stubs so old jupyter-book 1 urls (/chapter1.html) keep working (/chapter1/)
redirect() {  # redirect <stub file> <relative target>
  cat > "$1" <<EOF
<!DOCTYPE html>
<meta charset="utf-8">
<title>Redirecting…</title>
<link rel="canonical" href="$2">
<meta http-equiv="refresh" content="0; url=$2">
<script>location.replace("$2" + location.hash)</script>
EOF
}
for dir in "$SITE" "$SITE/cn"; do
  for page in "$dir"/*.json; do
    slug=$(basename "$page" .json)
    [ -d "$dir/$slug" ] && redirect "$dir/$slug.html" "$slug/"
  done
  for old in genindex search prf-prf; do redirect "$dir/$old.html" "./"; done
done
redirect "$SITE/cover.html" "front/"
redirect "$SITE/cn/cover.html" "intro/"

echo "# site ready in _site/"
