# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

DESCRIPTION="Units and constants in the HEP system of units"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
HOMEPAGE="https://github.com/scikit-hep/hepunits"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND=""
distutils_enable_tests pytest
