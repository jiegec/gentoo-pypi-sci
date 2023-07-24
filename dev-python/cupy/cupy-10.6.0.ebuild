# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 prefix pypi

DESCRIPTION="CuPy: A NumPy-compatible array library accelerated by CUDA"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
HOMEPAGE="https://cupy.dev/"

IUSE="rocm +cuda cudnn"
REQUIRED_USE="
	^^ ( cuda rocm )
	cudnn? ( cuda )"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
DEPEND="
	>=dev-python/cython-0.29.22[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.18.0[${PYTHON_USEDEP}]
	cuda? ( dev-util/nvidia-cuda-toolkit[profiler] )
	cudnn? ( dev-libs/cudnn )
	rocm? ( >=dev-util/hip-5
		sci-libs/hipBLAS
		sci-libs/hipCUB
		sci-libs/hipFFT
		sci-libs/rocRAND
		sci-libs/rocThrust
		dev-util/roctracer
		sci-libs/hipSPARSE )"
RDEPEND=">=dev-python/fastrlock-0.5[${PYTHON_USEDEP}]
	${DEPEND}"

distutils_enable_tests pytest

PATCHES=( "${FILESDIR}"/cupy-10.6-add_dir.patch
	"${FILESDIR}"/includedir.patch
	"${FILESDIR}"/cupy-10.0-keep-temp.patch )

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
		export HCC_AMDGPU_TARGET="${AMDGPU_TARGETS//;/,}"
	elif use cuda; then
		# specify instructions to emit
		local target
		for target in ${NVPTX_TARGETS}; do
			CUPY_NVCC_GENERATE_CODE+="arch=${target/sm/compute},code=${target};"
		done
		export CUPY_NVCC_GENERATE_CODE

		NDEV="/dev/nvidia-uvm-tools"
		[[ -e ${NDEV} ]] || die \
			"${NDEV} does not exist. Try `nvidia-modprobe -u -c 0` to create it."
		for device in /dev/nvidia*; do
			addpredict "${device}"
		done
	fi
	distutils-r1_src_compile
}
