# 动手学差分隐私（Programming Differential Privacy）

This is the source repository for the book "Programming Differential Privacy." You can find the book online [here](https://uvm-plaid.github.io/programming-dp).

这是教材《动手学差分隐私（Programming Differential Privacy）》的源代码仓库。你可以[在此](https://uvm-plaid.github.io/programming-dp)在线阅读本教材。

## 声明（Declaration）

The translation work is authorized by original authors Joseph P. Near and Chiké Abuah. The translation is supported by the editor Lei Yao from China Machine Press. The Chinese version of the book will be freely available online, and there will be a printed version edited by China Machine Press.

本教材的翻译工作得到了原作者Joseph P. Near和Chiké Abuah的授权，并得到了机械工业出版社（China Machine Press）编辑姚蕾老师的支持。本教材的中文版本将免费在线发布，并推出机械工业出版社编辑的纸质版本。

## 翻译工具（Translation Tool）

The Chinese version of the book is translated via [DataSpell](https://www.jetbrains.com/dataspell/).

本书中文版应用[DataSpell](https://www.jetbrains.com/dataspell/)进行翻译。

## 安装Jupyter Book（Install Jupyter Book）

See [Jupyter Book Overview](https://jupyterbook.org/en/stable/start/overview.html) for details on installing Jupyter Book.

查看[Jupyter Book Overview](https://jupyterbook.org/en/stable/start/overview.html)给出的安装过程安装Jupyter Book工具。

> You can install Jupyter Book via [pip](https://pip.pypa.io/en/stable/):
> 
> 你可以通过[pip](https://pip.pypa.io/en/stable/)安装Jupyter Book：
> 
> ```shell
> pip install -U jupyter-book
> ```
> 
> or via [conda-forge](https://conda-forge.org/):
> 
> 或者通过[conda-forge](https://conda-forge.org/)安装Jupyter Book：
> 
> ```shell
> conda install -c conda-forge jupyter-book
> ```
> 
> This will install everything you need to build a Jupyter Book locally.
> 
> 这两种方法都可以安装在本地构建Jupyter Book所需的全部工具。

## 中文版本配置（Configuration for Chinese Version）

You need to add the following configuration in `_config.yml` to generate a well-displayed Chinese version of the PDF:

为使编译得到的PDF版本正确显示中文，需在`_config.yml`下增加下述配置：

```text
sphinx:
    config:
        language: zh_CN
```

Note that you may meet display problems when using Chinese labels in `matplotlib.pyplot`. We use a library named `mplfonts` to successfully solve that problem. See [here](https://www.zhihu.com/question/25404709) for details. First, install `mplfonts`.

当使用`matplotlib.pyplot`时，可能会遇到中文显示乱码的问题。我们成功使用`mplfonts`库解决了这个问题，详见[这里的描述](https://www.zhihu.com/question/25404709)。首先，安装`mplfonts`。

```shell
pip install mplfonts -i https://pypi.tuna.tsinghua.edu.cn/simple
```

Next, add the following codes before using `matplotlib.pyplot`.

随后，在使用`matplotlib.pyplot`前增加下述代码。

```python
from mplfonts.bin.cli import init
init()
from mplfonts import use_font
use_font('SimHei')
```

Unfortunately, the style `seaborn-whitegrid` used in the English version of the book does not support Chinese characters. We need to change `seaborn-whitegrid` as `fivethirtyeight`.

不幸的是，英文版书籍中使用的绘图风格`seaborn-whitegrid`不支持中文字符。我们需要把`seaborn-whitegrid`换为`fivethirtyeight`。

```python
import matplotlib.pyplot as plt
plt.style.use('fivethirtyeight')
```

## 编译中文版（Compile Chinese Version）

If you follow `deploy.sh` and direct execute `jupyter-book build .` under the directory containing source codes for the Chinese version, you may get the following error:

如果你应用`deploy.sh`描述的方法，在中文版源代码目录下直接执行`jupyter-book build .`，你将会看到下述错误信息：

```text
The Table of Contents file is malformed: toc is not a mapping: <class 'list'>
You may need to migrate from the old format, using:

        jupyter-book toc migrate /XXX/zh_cn/_toc.yml -o /XXX/zh_cn/_toc.yml
```

Please just execute the recommended instruction to migrate `_toc.yml` from the old format.

如果使用新版本的`jupyter-book`完成编译，需先在源代码目录下执行下述命令，将`_toc.yml`迁移为新版本。

```text
jupyter-book toc migrate /XXX/zh_cn/_toc.yml -o /XXX/zh_cn/_toc.yml
```

For old-format `_toc.yml`, `jupyter-book` would treat it as an article (`format: jb-article`) rather than a book (`format: jb-book`). You need to modify the auto-generated `_toc.yml` by changing `format: jb-article` to `format: jb-book`, and changing `sections:` to `chapters:`. After that, you can successfully build the project and generate the PDF version with the correct format.

对于旧版本的`_toc.yml`，`jupyter-book`会把项目看成是文章（`format: jb-article`）而非书籍（`format: jb-book`）。为此，需要对自动迁移的`_toc.yml`进行修改，将`format: jb-article`替换为`format: jb-book`，并将`sections:`替换为`chapters:`。这样就可以成功构建项目，并生成正确格式的PDF。