# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Differentiate, compile, and transform Numpy code"
HOMEPAGE="https://github.com/jax-ml/jax"
SRC_URI="$(pypi_sdist_url "${PN}" "${PV}")"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="rocm"

RDEPEND="
	~dev-python/jaxlib-${PV}[${PYTHON_USEDEP}]
	>=dev-python/ml-dtypes-0.5.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-2.0[${PYTHON_USEDEP}]
	dev-python/opt-einsum[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.14[${PYTHON_USEDEP}]
	rocm? (
		~dev-python/jax-rocm7-plugin-${PV}[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
