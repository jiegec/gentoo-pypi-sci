# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..11} )
DISTUTILS_EXT=1

inherit distutils-r1 pypi

DESCRIPTION="Stockwell transform for Python"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
HOMEPAGE="https://github.com/claudiodsf/stockwell"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
DEPEND=">=dev-python/numpy-1.18.0[${PYTHON_USEDEP}]"
RDEPEND="sci-libs/fftw
	${DEPEND}"

distutils_enable_tests pytest

