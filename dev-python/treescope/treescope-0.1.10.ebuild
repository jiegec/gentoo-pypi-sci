# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit-core
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

DESCRIPTION="Interactive HTML pretty printer for nested data structures"
HOMEPAGE="https://github.com/google-deepmind/treescope"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=dev-python/numpy-1.25.2[${PYTHON_USEDEP}]"
BDEPEND="
	>=dev-python/flit-core-3.8[${PYTHON_USEDEP}]
	<dev-python/flit-core-4[${PYTHON_USEDEP}]
"
