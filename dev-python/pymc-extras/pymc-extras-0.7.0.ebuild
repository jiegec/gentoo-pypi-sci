# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION=" Powerful add-ons for PyMC "
HOMEPAGE=""

LICENSE="Apache-2"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="dev-python/better-optimize[${PYTHON_USEDEP}]
	dev-python/preliz[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/pymc[${PYTHON_USEDEP}]
	dev-python/pytensor[${PYTHON_USEDEP}]
	dev-python/scikit-learn[${PYTHON_USEDEP}]
"
distutils_enable_tests pytest
