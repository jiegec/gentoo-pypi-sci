# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_11 python3_12 python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="Fast, re-entrant optimistic lock implemented in Cython"
HOMEPAGE="https://github.com/scoder/fastrlock"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"


distutils_enable_tests pytest
