# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Generalized Additive Models in Python"
HOMEPAGE="https://github.com/dswah/pyGAM"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	>=dev-python/progressbar2-4.2.0[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.11.1[${PYTHON_USEDEP}]
	<dev-python/scipy-1.17[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

