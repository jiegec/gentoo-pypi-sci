# gentoo-pypi-sci

包含了一些用 gentoo-pypi-generator 生成的 ebuild 。

## 使用方法

把本仓库 clone 到 `/var/db/repos/gentoo-pypi-sci` 目录.

创建 `/etc/portage/repos.conf/pypi-sci.conf`:

```
[pypi-sci]
location = /var/db/repos/gentoo-pypi-sci
```
