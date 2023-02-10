# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="Python code for Zernike polynomials"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://github.com/jacopoantonello/zernike"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

distutils_enable_tests pytest
