# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..13} )
DISTUTILS_USE_PEP517=flit

inherit distutils-r1 pypi

DESCRIPTION="Probability distributions implemented with PyTensor"
HOMEPAGE="https://github.com/pymc-devs/pytensor-distributions"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-2[${PYTHON_USEDEP}]
	>=dev-python/pytensor-3[${PYTHON_USEDEP}]
	<dev-python/pytensor-4[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
