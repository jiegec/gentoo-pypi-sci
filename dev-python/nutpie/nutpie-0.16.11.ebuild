# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

DESCRIPTION="Fast NUTS sampler for PyMC and Stan models"
HOMEPAGE="https://github.com/pymc-devs/nutpie"
SRC_URI="
	amd64? (
		python_targets_python3_12? ( $(pypi_wheel_url "${PN}" "${PV}" cp312 cp312-manylinux_2_17_x86_64.manylinux2014_x86_64) )
		python_targets_python3_13? ( $(pypi_wheel_url "${PN}" "${PV}" cp313 cp313-manylinux_2_17_x86_64.manylinux2014_x86_64) )
	)
"
S=${WORKDIR}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+pymc-jax"
RESTRICT="strip"

RDEPEND="
	>=dev-python/pyarrow-12.0.0[${PYTHON_USEDEP}]
	>=dev-python/arro3-core-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/pandas-2.0[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/xarray-2025.1.2[${PYTHON_USEDEP}]
	>=dev-python/arviz-0.23.0[${PYTHON_USEDEP}]
	<dev-python/arviz-2.0[${PYTHON_USEDEP}]
	>=dev-python/obstore-0.8.0[${PYTHON_USEDEP}]
	>=dev-python/zarr-3.1.0[${PYTHON_USEDEP}]
	pymc-jax? (
		>=dev-python/pymc-5.20.1[${PYTHON_USEDEP}]
		~dev-python/jax-0.9.2[rocm,${PYTHON_USEDEP}]
	)
"

QA_PREBUILT=( "/usr/lib/python*/site-packages/nutpie/*.so" )

python_compile() {
	local pyver=${EPYTHON#python}
	pyver=${pyver/.}
	local wheel="$(pypi_wheel_name "${PN}" "${PV}" "cp${pyver}" "cp${pyver}-manylinux_2_17_x86_64.manylinux2014_x86_64")"

	distutils_wheel_install "${BUILD_DIR}/install" "${DISTDIR}/${wheel}"
}
