# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_11 python3_12 python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="A Textual widget wrapper for the Plotext plotting library"
HOMEPAGE="https://github.com/Textualize/textual-plotext"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND=">=dev-python/plotext-5.2.8[${PYTHON_USEDEP}]
	>=dev-python/textual-0.86.2[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
