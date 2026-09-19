# 动手学差分隐私（Programming Differential Privacy）

This is the source repository for the book "Programming Differential Privacy." You can find the book online [here](https://programming-dp.com/cn/).

这是教材《动手学差分隐私（Programming Differential Privacy）》的源代码仓库。你可以[在此](https://programming-dp.com/cn/)在线阅读本教材。

## 声明（Declaration）

The translation work is authorized by original authors Joseph P. Near and Chiké Abuah. The translation is supported by the editor Lei Yao from China Machine Press. The Chinese version of the book will be freely available online, and there will be a printed version edited by China Machine Press.

本教材的翻译工作得到了原作者Joseph P. Near和Chiké Abuah的授权，并得到了机械工业出版社（China Machine Press）编辑姚蕾老师的支持。本教材的中文版本将免费在线发布，并推出机械工业出版社编辑的纸质版本。

## 翻译工具（Translation Tool）

The Chinese version of the book is translated via [DataSpell](https://www.jetbrains.com/dataspell/).

本书中文版应用[DataSpell](https://www.jetbrains.com/dataspell/)进行翻译。

## 编译中文版（Compile Chinese Version）

The Chinese book is built with [Jupyter Book 2](https://jupyterbook.org) together with the English book. See the [main README](../README.md) for setup. Its configuration is in `notebooks/myst.yml`.

中文版与英文版一起使用[Jupyter Book 2](https://jupyterbook.org)构建，环境配置见[主README](../README.md)。中文版的配置文件为`notebooks/myst.yml`。

```shell
cd zh_cn/notebooks
BASE_URL=/cn jupyter-book build --html --pdf --execute
```

- The PDF uses `notebooks/_templates/latex_book_cjk`, the standard book template plus `ctex` for Chinese text (requires XeLaTeX and the `ctex` package).

  PDF使用`notebooks/_templates/latex_book_cjk`模板，即在标准书籍模板的基础上增加了`ctex`宏包以支持中文（需要XeLaTeX与`ctex`宏包）。

- Chinese labels in `matplotlib` plots use fonts from `mplfonts`. Install them once with `mplfonts init` (the build script does this); the notebooks then only call `use_font`:

  `matplotlib`图中的中文使用`mplfonts`提供的字体。先执行一次`mplfonts init`安装字体（构建脚本会自动执行），笔记本中只需调用`use_font`：

  ```python
  from mplfonts import use_font
  use_font('SimHei')
  import matplotlib.pyplot as plt
  plt.style.use('fivethirtyeight')
  ```
