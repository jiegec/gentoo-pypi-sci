# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYPI_PN=${PN}
DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 multiprocessing multilib

DESCRIPTION="ROCm PJRT runtime for JAX"
HOMEPAGE="https://github.com/ROCm/rocm-jax"
ROCM_JAX_COMMIT=3415765941b59310e070eb222e85bfa06efcafe6
XLA_COMMIT=60f77b59e233ffb97d039086f0531ab75d7e0181
BAZEL_VERSION=7.7.0
SRC_URI="
	https://codeload.github.com/ROCm/rocm-jax/tar.gz/${ROCM_JAX_COMMIT} -> rocm-jax-${ROCM_JAX_COMMIT}.tar.gz
	https://codeload.github.com/ROCm/xla/tar.gz/${XLA_COMMIT} -> xla-${XLA_COMMIT}.tar.gz
	https://releases.bazel.build/${BAZEL_VERSION}/release/bazel-${BAZEL_VERSION}-linux-x86_64
	https://github.com/astral-sh/python-build-standalone/releases/download/20251209/cpython-3.13.11+20251209-x86_64-unknown-linux-gnu-install_only.tar.gz
"
S=${WORKDIR}/rocm-jax-${ROCM_JAX_COMMIT}/jax_rocm_plugin

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
# Bazel resolves its pinned third-party repositories during compilation.
RESTRICT="strip network-sandbox"

ROCM_VERSION=7.2.0
LLVM_SLOT=22

BDEPEND="
	app-arch/unzip
	app-arch/zip
	app-misc/ca-certificates
	dev-vcs/git
	dev-util/patchelf
	sys-apps/which
"

RDEPEND="
	=dev-build/rocm-cmake-${ROCM_VERSION}*
	=dev-libs/rocm-comgr-${ROCM_VERSION}*
	>=dev-libs/rocm-comgr-${ROCM_VERSION}-r1
	=dev-libs/rocm-core-${ROCM_VERSION}*
	=dev-libs/rocm-device-libs-${ROCM_VERSION}*
	=dev-libs/rocr-runtime-${ROCM_VERSION}*
	=dev-util/hip-${ROCM_VERSION}*
	=dev-util/hipcc-${ROCM_VERSION}*
	=dev-util/hipify-clang-${ROCM_VERSION}*
	=dev-util/rocm-smi-${ROCM_VERSION}*
	=dev-util/rocminfo-${ROCM_VERSION}*
	=dev-util/roctracer-${ROCM_VERSION}*
	=dev-util/rocprofiler-${ROCM_VERSION}*
	=dev-util/rocprofiler-register-${ROCM_VERSION}*
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
	sys-process/numactl
	llvm-core/clang:${LLVM_SLOT}
	llvm-core/lld:${LLVM_SLOT}
"

DEPEND="${RDEPEND}
	=sci-libs/hipCUB-${ROCM_VERSION}*
	=sci-libs/rocPRIM-${ROCM_VERSION}*
	=sci-libs/rocThrust-${ROCM_VERSION}*
"

src_unpack() {
	unpack "rocm-jax-${ROCM_JAX_COMMIT}.tar.gz" "xla-${XLA_COMMIT}.tar.gz"
}

src_prepare() {
	default
	eapply "${FILESDIR}/rocm-jax-34157659-native-paths.patch"
	sed -i -e "s|@GENTOO_ROCM_LIBDIR@|${EPREFIX}/usr/$(get_libdir)|g" \
		pjrt/tools/build_gpu_plugin_wheel.py || die

	local xla="${WORKDIR}/xla-${XLA_COMMIT}"
	# --override_repository bypasses the patches in upstream's git_repository.
	(
		cd "${xla}" || die
		eapply "${S}/third_party/xla/0001-Add-clang-resource-dir-include-path.patch"
		eapply "${S}/third_party/xla/0002-upgrade-rules-python-to-1.8.5.patch"
		eapply "${FILESDIR}/xla-60f77b59-gentoo-rocm-defaults.patch"
		eapply "${FILESDIR}/xla-60f77b59-glibc244.patch"
	) || die

	sed -i \
		-e "s|@GENTOO_ROCM_ROOT@|${EPREFIX}/usr|g" \
		-e "s|@GENTOO_ROCM_LIBDIR@|${EPREFIX}/usr/$(get_libdir)|g" \
		"${xla}/third_party/gpus/rocm_configure.bzl" \
		"${xla}/third_party/gpus/rocm/BUILD.tpl" \
		"${xla}/third_party/gpus/crosstool/clang/bin/crosstool_wrapper_driver_rocm.tpl" || die
	sed -i \
		-e "s|@GENTOO_LLVM_ROOT@|${EPREFIX}/usr/lib/llvm/${LLVM_SLOT}|g" \
		"${xla}/xla/service/gpu/llvm_gpu_backend/amdgpu_backend.cc" || die

	cp "${DISTDIR}/bazel-${BAZEL_VERSION}-linux-x86_64" "${S}/bazel" || die
	chmod +x "${S}/bazel" || die
}

src_configure() {
	# Supply the monolithic layout expected by Bazel, confined to WORKDIR.
	# The compiled runtime defaults still point to EPREFIX, never this tree.
	local sdk="${WORKDIR}/rocm-sdk"
	mkdir -p "${sdk}/bin" "${sdk}/lib" "${sdk}/include" || die
	local path
	# Only ROCm libraries belong in this SDK. Re-exporting libc linker scripts
	# through a path outside EPREFIX prevents lld from applying its sysroot.
	for path in "${EPREFIX}/usr/$(get_libdir)"/lib{amd,hip,hsa,MIOpen,rccl,roc}*.so*; do
		if [[ -f ${path} || -L ${path} ]]; then
			ln -s "${path}" "${sdk}/lib/" || die
		fi
	done
	for path in hipcc hipconfig rocm_agent_enumerator; do
		ln -s "${EPREFIX}/usr/bin/${path}" "${sdk}/bin/${path}" || die
	done
	ln -s lib "${sdk}/lib64" || die
	# Exclude unrelated Prefix headers (notably system protobuf and libc).
	# Bazel makes every file in this directory a public ROCm include.
	for path in hip hipblas hipblas-common hipblaslt hipcub hipfft hiprand \
		hipsolver hipsparse hsa miopen rccl rocblas rocfft rocm-core rocprim \
		rocprofiler-register rocprofiler-sdk rocprofiler-sdk-roctx rocrand \
		rocsolver rocsparse roctracer thrust hipblaslt-export.h hipblaslt-version.h; do
		if [[ -e ${EPREFIX}/usr/include/${path} ]]; then
			ln -s "${EPREFIX}/usr/include/${path}" "${sdk}/include/${path}" || die
		fi
	done
	ln -s "${EPREFIX}/usr/lib/llvm/${LLVM_SLOT}" "${sdk}/llvm" || die
	ln -s "${EPREFIX}/usr/lib/llvm/${LLVM_SLOT}" "${sdk}/lib/llvm" || die
	ln -s "${EPREFIX}/usr/lib/amdgcn" "${sdk}/amdgcn" || die
}

python_compile() {
	local wheels=( "${S}"/dist/jax_rocm7_pjrt-*.whl )
	if [[ ! -f ${wheels[0]} ]]; then
		local sdk="${WORKDIR}/rocm-sdk"
		local llvm="${EPREFIX}/usr/lib/llvm/${LLVM_SLOT}"
		local -x PATH="${llvm}/bin:${EPREFIX}/usr/bin:${EPREFIX}/bin:${PATH}"
		local -x JAX_RELEASE=1
		"${EPYTHON}" build/build.py build \
			--wheels=jax-rocm-pjrt \
			--python_version="${EPYTHON#python}" \
			--bazel_path="${S}/bazel" \
			--bazel_startup_options=--batch \
			--bazel_startup_options="--output_user_root=${T}/bazel" \
			--local_xla_path="${WORKDIR}/xla-${XLA_COMMIT}" \
			--rocm_path="${sdk}" \
			--rocm_amdgpu_targets=gfx908,gfx90a,gfx1100 \
			--clang_path="${llvm}/bin/clang" \
			--bazel_options="--jobs=$(makeopts_jobs)" \
			--bazel_options="--distdir=${DISTDIR}" \
			--bazel_options="--repo_env=LLVM_PATH=${llvm}" \
			--bazel_options="--action_env=HIP_CLANG_PATH=${llvm}/bin" \
			--bazel_options="--action_env=HIP_DEVICE_LIB_PATH=${EPREFIX}/usr/lib/amdgcn/bitcode" \
			--bazel_options="--linkopt=-Wl,-rpath,${EPREFIX}/usr/$(get_libdir)" \
			--bazel_options="--linkopt=-Wl,--sysroot,${EPREFIX}/" \
			--bazel_options="--host_linkopt=-Wl,--sysroot,${EPREFIX}/" \
			--output_path="${S}/dist" || die
		wheels=( "${S}"/dist/jax_rocm7_pjrt-*.whl )
	fi
	[[ ${#wheels[@]} == 1 && -f ${wheels[0]} ]] || die "Expected one PJRT wheel"
	distutils_wheel_install "${BUILD_DIR}/install" "${wheels[0]}"
}
