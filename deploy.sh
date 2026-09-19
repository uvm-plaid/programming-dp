#!/usr/bin/env bash
# Manual deploy from a local machine. Normally not needed: pushing to master
# deploys via .github/workflows/deploy.yml.
# Setup: uv venv --python 3.12 .venv && uv pip install --python .venv/bin/python -r requirements.txt
set -euo pipefail
cd "$(dirname "$0")"
./build.sh
[ -d .venv ] && export PATH="$PWD/.venv/bin:$PATH"
echo "# deploy book"
ghp-import -n -p -f _site
