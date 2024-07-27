# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_1{0..2} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Awkward Array Pandas Extension."
HOMEPAGE="https://github.com/intake/akimbo"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="dev-python/pandas[${PYTHON_USEDEP}]
dev-python/pyarrow"

distutils_enable_tests pytest
