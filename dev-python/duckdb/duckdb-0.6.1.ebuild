# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_9 python3_1{0,1} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="DuckDB embedded database"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://www.duckdb.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
PATCHES=( "${FILESDIR}"/${PN}-0.6.1-no_setuptools_scm.patch )
RDEPEND=">=dev-python/numpy-1.14[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
