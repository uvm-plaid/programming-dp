# Programming Differential Privacy

This is the source repository for the book "Programming Differential Privacy." You can find the book online [here!](https://programming-dp.com/).

# Build Notes

The English book (`notebooks/`) and the Chinese translation (`zh_cn/notebooks/`) are built with [Jupyter Book 2](https://jupyterbook.org); each has a `myst.yml`.

**Deploys are automatic:** every push to `master` runs `.github/workflows/deploy.yml`, which builds both books and publishes them to the `gh-pages` branch (English at `/`, Chinese at `/cn/`). Executed notebook outputs are cached, so only notebooks that changed are re-run.

To build locally you need Python 3.12, [uv](https://docs.astral.sh/uv/), Node.js 20+, and XeLaTeX with `ctex` (e.g. MacTeX) for the PDFs:

```
uv venv --python 3.12 .venv
uv pip install --python .venv/bin/python -r requirements.txt
./build.sh
```

This builds both books (html and pdf) with `--strict`, so any build warning fails the build, and assembles the site in `_site/`. To preview one book while editing:

```
cd notebooks && ../.venv/bin/jupyter-book start --execute
```

`./deploy.sh` builds and publishes from your machine, bypassing CI.

## License

[![License: CC BY-NC-SA 4.0](https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

- The **book content** is licensed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/):  
  You may share and adapt with attribution, for non-commercial purposes, and under the same license.

- The **code examples** are licensed under the [MIT License](LICENSE):  
  You may use, modify, and distribute the code freely, even for commercial use.


