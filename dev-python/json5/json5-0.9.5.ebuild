# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

DESCRIPTION="A Python implementation of the JSON5 data format."
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
HOMEPAGE="https://github.com/dpranke/pyjson5"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND=""
distutils_enable_tests pytest
