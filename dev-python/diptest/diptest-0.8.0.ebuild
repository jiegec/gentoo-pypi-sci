# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )

DISTUTILS_USE_PEP517=scikit-build-core
inherit cmake distutils-r1 pypi

DESCRIPTION="Hartigan's diptest."
HOMEPAGE="https://github.com/RUrlus/diptest"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]"
distutils_enable_tests pytest

src_configure()
{
	SKBUILD_CMAKE_ARGS="-DDIPTEST_ENABLE_OPENMP=ON" distutils-r1_src_configure
}
