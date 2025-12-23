# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )

DISTUTILS_USE_PEP517=poetry

inherit distutils-r1 pypi

DESCRIPTION="A Textual widget wrapper for the Plotext plotting library"
HOMEPAGE="https://github.com/Textualize/textual-plotext"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="dev-python/plotext[${PYTHON_USEDEP}]
	dev-python/textual[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
