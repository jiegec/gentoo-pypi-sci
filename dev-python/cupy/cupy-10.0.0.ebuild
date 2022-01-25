# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )

IUSE="rocm"

inherit distutils-r1 prefix

DESCRIPTION="CuPy: A NumPy-compatible array library accelerated by CUDA"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://cupy.dev/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
DEPEND="rocm? ( sci-libs/hipBLAS )"
RDEPEND=">=dev-python/fastrlock-0.5"

distutils_enable_tests pytest

PATCHES=( "${FILESDIR}/add_dir.patch"
	"${FILESDIR}/includedir.patch" )


src_prepare ()
{
	default
	eprefixify cupy/cuda/compiler.py
}

src_compile() {
	if use rocm; then
		addwrite /dev/kfd
		addwrite /dev/dri/
		export CUPY_INSTALL_USE_HIP=1
		export ROCM_HOME="${EPREFIX}/usr"
		export HCC_AMDGPU_TARGET="${AMDGPU_TARGETS}"
		export HIPCC="${EPREFIX}/usr/lib/hip/bin/hipcc"
	fi
	distutils-r1_src_compile
}
