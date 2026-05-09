EAPI=8

inherit cmake

DESCRIPTION="Registration library for ROCm profilers"
HOMEPAGE="https://github.com/ROCm/rocm-systems"

FMT_COMMIT="123913715afeb8a437e6388b4473fcc4753e1c9a"
GLOG_COMMIT="7b134a5c82c0c0b5698bb6bf7a835b230c5638e4"

SRC_URI="
	https://github.com/ROCm/rocm-systems/archive/refs/tags/rocm-${PV}.tar.gz -> rocm-systems-${PV}.tar.gz
	https://github.com/fmtlib/fmt/archive/${FMT_COMMIT}.tar.gz -> fmt-${FMT_COMMIT}.tar.gz
	https://github.com/google/glog/archive/${GLOG_COMMIT}.tar.gz -> glog-${GLOG_COMMIT}.tar.gz
"

LICENSE="MIT"
SLOT="0/0"
KEYWORDS="~amd64"

S="${WORKDIR}/rocm-systems-rocm-${PV}/projects/rocprofiler-register"

DEPEND="
	>=dev-libs/rocm-core-${PV}:=
"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/${P}-disable-packaging.patch"
	"${FILESDIR}/${P}-respect-cmake-install-libdir.patch"
)

src_prepare() {
	rm -rf "${S}/external/fmt" "${S}/external/glog" || die
	ln -s "${WORKDIR}/fmt-${FMT_COMMIT}" "${S}/external/fmt" || die
	ln -s "${WORKDIR}/glog-${GLOG_COMMIT}" "${S}/external/glog" || die

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DROCPROFILER_REGISTER_BUILD_FMT=ON
		-DROCPROFILER_REGISTER_BUILD_GLOG=ON
		-DROCPROFILER_REGISTER_BUILD_SAMPLES=OFF
		-DROCPROFILER_REGISTER_BUILD_TESTS=OFF
		-DROCM_DEP_ROCMCORE=ON
		-DROCPROFILER_REGISTER_DEP_ROCMCORE=ON
		-DROCPROFILER_REGISTER_BUILD_PACKAGING=OFF
	)

	cmake_src_configure
}
