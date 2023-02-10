# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="Units and constants in the HEP system of units"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://github.com/scikit-hep/hepunits"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND=""
distutils_enable_tests pytest
