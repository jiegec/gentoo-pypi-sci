# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

DESCRIPTION="Pythonic mix-ins for ROOT classes."
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
HOMEPAGE="https://github.com/scikit-hep/uproot3-methods"

LICENSE="BSD 3-clause"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND=">=dev-python/numpy-1.13.1[${PYTHON_USEDEP}]
	dev-python/awkward0[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
