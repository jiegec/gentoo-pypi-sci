# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=meson-python
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

DESCRIPTION="SHTOOLS - Spherical Harmonic Tools"
HOMEPAGE="https://shtools.github.io/SHTOOLS/"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/xarray[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/pooch[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/palettable[${PYTHON_USEDEP}]
	dev-python/astropy[${PYTHON_USEDEP}]
	sci-libs/fftw
	sys-devel/gcc[fortran]
	sci-libs/openblas
"
	# sci-libs/cartopy[${PYTHON_USEDEP}]
distutils_enable_tests pytest
