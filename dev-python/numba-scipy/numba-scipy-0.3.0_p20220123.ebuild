# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

DESCRIPTION="numba-scipy extends Numba to make it aware of SciPy"
SRC_URI="https://github.com/numba/numba-scipy/archive/23dc6ef6b3c6.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://github.com/numba/numba-scipy"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

S=${WORKDIR}/${PN}-23dc6ef6b3c6b12415bffcb09ffffdcf6148ab6f

IUSE=""
RDEPEND="dev-python/scipy[${PYTHON_USEDEP}]
	>=dev-python/numba-0.45[${PYTHON_USEDEP}]"
distutils_enable_tests pytest

PATCHES=( ${FILESDIR}/numba-scipy-0.3.0-version.patch )
