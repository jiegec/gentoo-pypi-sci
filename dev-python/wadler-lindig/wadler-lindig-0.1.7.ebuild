# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

DESCRIPTION="Wadler-Lindig pretty printer for Python"
HOMEPAGE="https://github.com/patrick-kidger/wadler_lindig"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
