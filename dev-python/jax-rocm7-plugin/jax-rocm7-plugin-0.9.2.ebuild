# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYPI_PN=${PN}
DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="ROCm plugin for JAX"
HOMEPAGE="https://github.com/ROCm/rocm-jax"
SRC_URI="
	amd64? (
		$(pypi_wheel_url "${PYPI_PN}" "${PV}" cp311 cp311-manylinux_2_28_x86_64)
		$(pypi_wheel_url "${PYPI_PN}" "${PV}" cp312 cp312-manylinux_2_28_x86_64)
		$(pypi_wheel_url "${PYPI_PN}" "${PV}" cp313 cp313-manylinux_2_28_x86_64)
	)
"
S=${WORKDIR}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

ROCM_VERSION=7.1.0
LLVM_SLOT=18

RDEPEND="
	~dev-python/jax-rocm7-pjrt-${PV}[${PYTHON_USEDEP}]
	=dev-build/rocm-cmake-${ROCM_VERSION}*
	=dev-libs/rocm-comgr-${ROCM_VERSION}*
	=dev-libs/rocm-core-${ROCM_VERSION}*
	=dev-libs/rocm-device-libs-${ROCM_VERSION}*
	=dev-libs/rocr-runtime-${ROCM_VERSION}*
	=dev-util/hip-${ROCM_VERSION}*
	=dev-util/hipcc-${ROCM_VERSION}*
	=dev-util/hipify-clang-${ROCM_VERSION}*
	=dev-util/rocm-smi-${ROCM_VERSION}*
	=dev-util/rocminfo-${ROCM_VERSION}*
	=dev-util/roctracer-${ROCM_VERSION}*
	=dev-libs/rccl-${ROCM_VERSION}*
	=sci-libs/hipBLAS-${ROCM_VERSION}*
	=sci-libs/hipBLASLt-${ROCM_VERSION}*
	=sci-libs/hipFFT-${ROCM_VERSION}*
	=sci-libs/hipRAND-${ROCM_VERSION}*
	=sci-libs/hipSOLVER-${ROCM_VERSION}*
	=sci-libs/hipSPARSE-${ROCM_VERSION}*
	=sci-libs/miopen-${ROCM_VERSION}*
	=sci-libs/rocBLAS-${ROCM_VERSION}*
	=sci-libs/rocFFT-${ROCM_VERSION}*
	=sci-libs/rocRAND-${ROCM_VERSION}*
	=sci-libs/rocSOLVER-${ROCM_VERSION}*
	=sci-libs/rocSPARSE-${ROCM_VERSION}*
	llvm-core/clang:${LLVM_SLOT}
	llvm-core/lld:${LLVM_SLOT}
"

QA_PREBUILT=(
	"/usr/lib/python*/site-packages/jax_rocm7_plugin/*.so"
)

python_compile() {
	local pyver=${EPYTHON#python}
	pyver=${pyver/.}
	local wheel="$(pypi_wheel_name "${PYPI_PN}" "${PV}" "cp${pyver}" "cp${pyver}-manylinux_2_28_x86_64")"

	distutils_wheel_install "${BUILD_DIR}/install" "${DISTDIR}/${wheel}"
}

python_install_all() {
	distutils-r1_python_install_all

	local envd="${T}/99jax-rocm7"
	{
		echo "ROCM_PATH=\"${EPREFIX}/usr\""
		echo "LLVM_PATH=\"${EPREFIX}/usr/lib/llvm/${LLVM_SLOT}\""
		echo 'TF_NEED_ROCM="1"'
	} > "${envd}" || die

	doenvd "${envd}"
}
