# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="Jupyter terminal console"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://jupyter.org"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="dev-python/jupyter_client
	dev-python/ipython
	dev-python/ipykernel
	dev-python/prompt-toolkit
	dev-python/pygments
	dev-python/pexpect"
distutils_enable_tests pytest
