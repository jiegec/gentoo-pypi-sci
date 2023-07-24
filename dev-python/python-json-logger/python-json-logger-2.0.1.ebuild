# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

DESCRIPTION="A python library adding a json log formatter"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
HOMEPAGE="http://github.com/madzak/python-json-logger"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"


distutils_enable_tests pytest
