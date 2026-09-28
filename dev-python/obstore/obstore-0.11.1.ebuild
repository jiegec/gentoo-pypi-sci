# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

DESCRIPTION="Python interface to object storage from Rust"
HOMEPAGE="https://developmentseed.org/obstore/"
SRC_URI="amd64? ( $(pypi_wheel_url "${PN}" "${PV}" cp311 abi3-manylinux_2_17_x86_64.manylinux2014_x86_64) )"
S=${WORKDIR}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

RDEPEND="dev-python/typing-extensions[${PYTHON_USEDEP}]"

QA_PREBUILT=( "/usr/lib/python*/site-packages/obstore/*.so" )

python_compile() {
	local wheel="$(pypi_wheel_name "${PN}" "${PV}" cp311 abi3-manylinux_2_17_x86_64.manylinux2014_x86_64)"
	distutils_wheel_install "${BUILD_DIR}/install" "${DISTDIR}/${wheel}"
}
