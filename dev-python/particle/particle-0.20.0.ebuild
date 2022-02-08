# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_9 python3_10 )

inherit distutils-r1

DESCRIPTION="Extended PDG particle data and MC identification codes"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://github.com/scikit-hep/particle"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND=">=dev-python/attrs-19.2[${PYTHON_USEDEP}]
	dev-python/deprecated[${PYTHON_USEDEP}]
	>=dev-python/hepunits-2.0.0[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
