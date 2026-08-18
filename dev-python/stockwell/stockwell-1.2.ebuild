# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Time-frequency analysis through Stockwell transform"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
HOMEPAGE="https://github.com/claudiodsf/stockwell"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND="
	>=dev-python/numpy-1.18.0[${PYTHON_USEDEP}]
"
BDEPEND="
	${DEPEND}
"
RDEPEND="
	sci-libs/fftw
	${DEPEND}
"

distutils_enable_tests pytest
