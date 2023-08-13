# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="numba-scipy extends Numba to make it aware of SciPy"
HOMEPAGE="https://github.com/numba/numba-scipy"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="dev-python/scipy[${PYTHON_USEDEP}]
	>=dev-python/numba-0.45[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
