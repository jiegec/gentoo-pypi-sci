# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

DESCRIPTION="Extended PDG particle data and MC identification codes"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
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
