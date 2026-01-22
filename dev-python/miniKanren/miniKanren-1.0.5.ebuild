# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Relational programming in Python"
HOMEPAGE="None"

LICENSE="None"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="dev-python/cons[${PYTHON_USEDEP}]
	dev-python/etuples[${PYTHON_USEDEP}]
	dev-python/logical-unification[${PYTHON_USEDEP}]
	dev-python/multipledispatch[${PYTHON_USEDEP}]
	dev-python/toolz[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
