# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 python3_8 )

inherit distutils-r1

DESCRIPTION="Utility to create and sign CAs and certificates"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://github.com/LLNL/certipy"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE="dev test"
RDEPEND="dev-python/pyopenssl
	dev? ( dev-python/pytest )
	test? ( dev-python/pytest )"
distutils_enable_tests pytest
