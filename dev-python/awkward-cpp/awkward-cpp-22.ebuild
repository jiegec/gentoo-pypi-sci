# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=scikit-build-core
DISTUTILS_EXT=1
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="CPU kernels and compiled extensions for Awkward Array."
HOMEPAGE="https://awkward-array.org/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND=">=dev-python/numpy-1.13.1[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
