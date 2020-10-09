# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 python3_7 python3_8 )

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
	dev-python/prompt-toolkit (!=3.0.0,!=3.0.1,<3.1.0,>=2.0.0)
	dev-python/pygments
	dev-python/pexpect ; (sys_platform != "win32") and extra == 'test'"
distutils_enable_tests pytest
