# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_9 )

inherit distutils-r1

DESCRIPTION="LightGBM Python Package"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
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
