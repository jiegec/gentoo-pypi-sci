# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_9 python3_1{0,1} )
DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
inherit distutils-r1 pypi

DESCRIPTION="Bridge Arrow between Python and R when using rpy2"
HOMEPAGE="https://rpy2.github.io/rpy2-arrow"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="dev-python/pyarrow[${PYTHON_USEDEP}]
	dev-python/rpy2[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/rpy2-r6[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
