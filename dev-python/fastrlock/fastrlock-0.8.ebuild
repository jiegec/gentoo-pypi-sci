# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Fast, re-entrant optimistic lock implemented in Cython"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${PN/-/_}-${PV}.tar.gz"
HOMEPAGE="https://github.com/scoder/fastrlock"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

distutils_enable_tests pytest
