EAPI=8

PYTHON_COMPAT=( python3_{11..14} )

inherit cmake python-single-r1

DESCRIPTION="ROCm GPU performance analysis SDK and profiling tools"
HOMEPAGE="https://github.com/ROCm/rocm-systems/tree/develop/projects/rocprofiler-sdk"

FMT_COMMIT="0bffed89579ac8a210379fd640569e4b75fe28c8"
GLOG_COMMIT="34b8da6496aec6a98277808701cfa834fae9801f"
PTL_COMMIT="48df41625430d27ce43cf197fd467a8dda87cb45"
YAML_CPP_COMMIT="1d8ca1f35eb3a9c9142462b28282a848e5d29a91"
CEREAL_COMMIT="e736e75d9d8cd4cc01614f21097f185dc2c6a6bc"
PERFETTO_COMMIT="eb5ef24c58d13cec289d733d03f0f3f0ed321b12"
ELFIO_COMMIT="8ae6cec5d60495822ecd57d736f66149da9b1830"
JSON_COMMIT="e41905fcb0938a7502d25ea5242c6b41396e21b0"
PYBIND11_COMMIT="914c06fb252b6cc3727d0eedab6736e88a3fcb01"
GOTCHA_COMMIT="b944da10ff9b3364ef2e4b12e02cb2464e05dd48"
OTF2_V="3.0.3"

SRC_URI="
	https://github.com/ROCm/rocm-systems/archive/refs/tags/rocm-${PV}.tar.gz -> rocm-systems-${PV}.tar.gz
	https://github.com/fmtlib/fmt/archive/${FMT_COMMIT}.tar.gz -> rocprofiler-sdk-fmt-${FMT_COMMIT}.tar.gz
	https://github.com/google/glog/archive/${GLOG_COMMIT}.tar.gz -> rocprofiler-sdk-glog-${GLOG_COMMIT}.tar.gz
	https://github.com/jrmadsen/PTL/archive/${PTL_COMMIT}.tar.gz -> rocprofiler-sdk-ptl-${PTL_COMMIT}.tar.gz
	https://github.com/jbeder/yaml-cpp/archive/${YAML_CPP_COMMIT}.tar.gz -> rocprofiler-sdk-yaml-cpp-${YAML_CPP_COMMIT}.tar.gz
	https://github.com/jrmadsen/cereal/archive/${CEREAL_COMMIT}.tar.gz -> rocprofiler-sdk-cereal-${CEREAL_COMMIT}.tar.gz
	https://github.com/google/perfetto/archive/${PERFETTO_COMMIT}.tar.gz -> rocprofiler-sdk-perfetto-${PERFETTO_COMMIT}.tar.gz
	https://github.com/serge1/ELFIO/archive/${ELFIO_COMMIT}.tar.gz -> rocprofiler-sdk-elfio-${ELFIO_COMMIT}.tar.gz
	https://github.com/nlohmann/json/archive/${JSON_COMMIT}.tar.gz -> rocprofiler-sdk-json-${JSON_COMMIT}.tar.gz
	https://github.com/pybind/pybind11/archive/${PYBIND11_COMMIT}.tar.gz -> rocprofiler-sdk-pybind11-${PYBIND11_COMMIT}.tar.gz
	https://github.com/ROCm/GOTCHA/archive/${GOTCHA_COMMIT}.tar.gz -> rocprofiler-sdk-gotcha-${GOTCHA_COMMIT}.tar.gz
	https://perftools.pages.jsc.fz-juelich.de/cicd/otf2/tags/otf2-${OTF2_V}/otf2-${OTF2_V}.tar.gz -> rocprofiler-sdk-otf2-${OTF2_V}.tar.gz
"

LICENSE="MIT"
SLOT="0/$(ver_cut 1-2)"
KEYWORDS="~amd64"
IUSE="test"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RESTRICT="!test? ( test )"

S="${WORKDIR}/rocm-systems-rocm-${PV}/projects/rocprofiler-sdk"

DEPEND="
	${PYTHON_DEPS}
	>=dev-libs/rocm-core-${PV}:=
	dev-libs/rocm-comgr:${SLOT}
	dev-libs/rocr-runtime:${SLOT}
	dev-libs/roct-thunk-interface:${SLOT}
	dev-libs/hsa-amd-aqlprofile:${SLOT}
	dev-util/hip:${SLOT}
	>=dev-util/rocprofiler-register-${PV}
	dev-libs/elfutils
	dev-db/sqlite
	sys-process/numactl
	x11-libs/libdrm
"
RDEPEND="${DEPEND}"
BDEPEND="
	${PYTHON_DEPS}
	virtual/pkgconfig
"

pkg_setup() {
	python-single-r1_pkg_setup
}

src_prepare() {
	rm -rf external/fmt external/glog external/ptl external/yaml-cpp \
		external/cereal external/perfetto external/elfio external/json \
		external/pybind11 external/gotcha || die
	ln -s "${WORKDIR}/fmt-${FMT_COMMIT}" external/fmt || die
	ln -s "${WORKDIR}/glog-${GLOG_COMMIT}" external/glog || die
	ln -s "${WORKDIR}/PTL-${PTL_COMMIT}" external/ptl || die
	ln -s "${WORKDIR}/yaml-cpp-${YAML_CPP_COMMIT}" external/yaml-cpp || die
	ln -s "${WORKDIR}/cereal-${CEREAL_COMMIT}" external/cereal || die
	ln -s "${WORKDIR}/perfetto-${PERFETTO_COMMIT}" external/perfetto || die
	ln -s "${WORKDIR}/ELFIO-${ELFIO_COMMIT}" external/elfio || die
	ln -s "${WORKDIR}/json-${JSON_COMMIT}" external/json || die
	ln -s "${WORKDIR}/pybind11-${PYBIND11_COMMIT}" external/pybind11 || die
	ln -s "${WORKDIR}/GOTCHA-${GOTCHA_COMMIT}" external/gotcha || die

	cmake_src_prepare

	sed -e '/set(CMAKE_INSTALL_LIBDIR "lib")/d' \
		-e 's#${PROJECT_BINARY_DIR}/lib#${PROJECT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR}#g' \
		-e 's#../lib#../${CMAKE_INSTALL_LIBDIR}#g' \
		-i CMakeLists.txt || die

	sed -e '/include(rocprofiler_config_packaging)/d' -i CMakeLists.txt || die
	sed -e '/#define ELFTYPES_H/a#include <cstdint>' \
		-i external/elfio/elfio/elf_types.hpp || die
	sed -e '/#include "yaml-cpp\/null.h"/i#include <cstdint>' \
		-i external/yaml-cpp/src/emitterutils.cpp || die
	sed -e '/#include <dlfcn.h>/i#include <fstream>' \
		-i source/lib/rocprofiler-sdk/counters/metrics.cpp || die
	sed -e '/#include <initializer_list>/i#include <fstream>' \
		-i source/lib/rocprofiler-sdk-rocpd/sql.cpp || die
	sed -e '/#include "lib\/att-tool\/util.hpp"/a#include <array>' \
		-i source/lib/att-tool/att_lib_wrapper.hpp || die

	# Replace OTF2 FetchContent with pre-fetched source
	sed -e '/fetchcontent_declare/,/fetchcontent_makeavailable/d' \
		-e '/FETCHCONTENT_BASE_DIR/d' \
		-e '/cmake_policy(SET CMP0135/d' \
		-e 's|include(FetchContent)|# FetchContent replaced by ebuild|' \
		-i external/otf2/CMakeLists.txt || die
}

src_configure() {
	local mycmakeargs=(
		-DROCM_PATH="${EPREFIX}/usr"
		-DROCPROFILER_BUILD_TESTS=$(usex test)
		-DROCPROFILER_BUILD_SAMPLES=OFF
		-DROCPROFILER_BUILD_BENCHMARK=OFF
		-DROCPROFILER_BUILD_DOCS=OFF
		-DROCPROFILER_BUILD_GHC_FS=OFF
		-DROCPROFILER_BUILD_FMT=ON
		-DROCPROFILER_BUILD_GLOG=ON
		-DROCPROFILER_BUILD_SQLITE3=OFF
		-DROCPROFILER_BUILD_PYBIND11=ON
		-DROCPROFILER_BUILD_GOTCHA=ON
		-DROCPROFILER_PYTHON_VERSIONS="${EPYTHON#python}"
		-DOTF2_VERSION="${OTF2_V}"
		-Dotf2-source_SOURCE_DIR="${WORKDIR}/otf2-${OTF2_V}"
	)

	cmake_src_configure
}
