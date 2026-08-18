# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 pypi

DESCRIPTION="XLA library for JAX"
HOMEPAGE="https://github.com/jax-ml/jax"
SRC_URI="
	amd64? (
		$(pypi_wheel_url "${PN}" "${PV}" cp313 cp313-manylinux_2_27_x86_64)
	)
"
S=${WORKDIR}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

RDEPEND="
	>=dev-python/ml-dtypes-0.5.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-2.0[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.14[${PYTHON_USEDEP}]
"

QA_PREBUILT=(
	"/usr/lib/python*/site-packages/jaxlib/*.so"
	"/usr/lib/python*/site-packages/jaxlib/**/*.so"
)

python_compile() {
	local pyver=${EPYTHON#python}
	pyver=${pyver/.}
	local wheel="$(pypi_wheel_name "${PN}" "${PV}" "cp${pyver}" "cp${pyver}-manylinux_2_27_x86_64")"

	distutils_wheel_install "${BUILD_DIR}/install" "${DISTDIR}/${wheel}"
}
