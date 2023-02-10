# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="Jupyter Notebook as a Jupyter Server Extension."
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="http://jupyter.org"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE="test"
RDEPEND="dev-python/jupyter-server[${PYTHON_USEDEP}]
	dev-python/notebook[${PYTHON_USEDEP}]
	test? ( dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-tornasync[${PYTHON_USEDEP}]
		dev-python/pytest-console-scripts[${PYTHON_USEDEP}] )"
distutils_enable_tests pytest
