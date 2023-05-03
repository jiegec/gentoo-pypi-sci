# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION=""
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://github.com/Calysto/matlab_kernel"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND=">=dev-python/metakernel-0.23.0
	>=dev-python/jupyter-client-4.4.0
	>=dev-python/ipython-4.0.0
	>=dev-python/wurlitzer-1.0.2"
distutils_enable_tests pytest
