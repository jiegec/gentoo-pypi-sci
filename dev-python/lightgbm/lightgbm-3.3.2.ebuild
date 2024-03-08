# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

DESCRIPTION="LightGBM Python Package"
HOMEPAGE="https://github.com/microsoft/LightGBM"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="dask"
RDEPEND="dev-python/wheel[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	sci-libs/scikit-learn[${PYTHON_USEDEP}]
	dask? ( dev-python/dask[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}] )"
distutils_enable_tests pytest
