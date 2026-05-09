EAPI=8

inherit cmake

DESCRIPTION="AMD HSA AQL profiling library"
HOMEPAGE="https://github.com/ROCm/rocm-systems/tree/develop/projects/aqlprofile"
SRC_URI="https://github.com/ROCm/rocm-systems/archive/refs/tags/rocm-${PV}.tar.gz -> rocm-systems-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0/$(ver_cut 1-2)"
KEYWORDS="~amd64"

S="${WORKDIR}/rocm-systems-rocm-${PV}/projects/aqlprofile"

DEPEND="
	dev-libs/rocr-runtime:${SLOT}
	>=dev-libs/rocm-core-${PV}:=
"
RDEPEND="${DEPEND}"

src_prepare() {
	cmake_src_prepare

	sed -e '/set(CMAKE_INSTALL_LIBDIR "lib"/d' \
		-i CMakeLists.txt || die
	sed -e '/^## If the library is a release/,/^endif ()/d' -i CMakeLists.txt || die
	sed -e '/^## Add the packaging directives/,$d' -i CMakeLists.txt || die
}

src_configure() {
	local mycmakeargs=(
		-DAQLPROFILE_BUILD_TESTS=OFF
		-DAQLPROFILE_INSTALL_TESTS=OFF
	)

	cmake_src_configure
}
