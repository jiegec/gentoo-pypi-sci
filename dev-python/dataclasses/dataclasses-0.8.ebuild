# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="A backport of the dataclasses module for Python 3.6"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://github.com/ericvsmith/dataclasses"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64"


distutils_enable_tests pytest
