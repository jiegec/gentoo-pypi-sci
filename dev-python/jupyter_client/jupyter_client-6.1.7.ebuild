# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="Jupyter protocol implementation and client libraries"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://jupyter.org"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE="test"
RDEPEND="dev-python/traitlets
	>=dev-python/jupyter_core-4.6.0
	>=dev-python/pyzmq-13
	>=dev-python/python-dateutil-2.1
	>=www-servers/tornado-4.1
	test? ( dev-python/ipykernel
		dev-python/ipython
		dev-python/mock
		dev-python/pytest
		dev-python/pytest-asyncio
		dev-python/async-generator
		dev-python/pytest-timeout )"
distutils_enable_tests pytest
