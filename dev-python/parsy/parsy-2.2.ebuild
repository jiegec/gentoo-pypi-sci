# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="Easy-to-use parser combinators, for parsing in pure Python"
HOMEPAGE="https://github.com/python-parsy/parsy"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"


distutils_enable_tests pytest
