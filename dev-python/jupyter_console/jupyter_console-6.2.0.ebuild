# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

DESCRIPTION="Jupyter terminal console"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
HOMEPAGE="https://jupyter.org"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="dev-python/jupyter-client
	dev-python/ipython
	dev-python/ipykernel
	dev-python/prompt-toolkit
	dev-python/pygments
	dev-python/pexpect"
distutils_enable_tests pytest
