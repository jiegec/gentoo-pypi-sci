# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="Python Optimal Transport Library"
HOMEPAGE="https://github.com/PythonOT/POT"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND=">=dev-python/numpy-1.16[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.6[${PYTHON_USEDEP}]
	dev-python/cython[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
