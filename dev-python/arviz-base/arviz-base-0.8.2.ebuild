# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Base ArviZ features and converters."
HOMEPAGE="None"

LICENSE="None"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/xarray[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
distutils_enable_tests pytest
