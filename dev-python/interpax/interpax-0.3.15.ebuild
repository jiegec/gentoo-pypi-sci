# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

DESCRIPTION="Interpolation and function approximation with JAX"
HOMEPAGE="https://github.com/f0uriest/interpax"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/equinox-0.11.0[${PYTHON_USEDEP}]
	<dev-python/equinox-0.14[${PYTHON_USEDEP}]
	~dev-python/jax-0.9.2[rocm,${PYTHON_USEDEP}]
	>=dev-python/jaxtyping-0.2.24[${PYTHON_USEDEP}]
	<dev-python/jaxtyping-0.4[${PYTHON_USEDEP}]
	>=dev-python/lineax-0.0.5[${PYTHON_USEDEP}]
	<dev-python/lineax-0.2[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.20.0[${PYTHON_USEDEP}]
	<dev-python/numpy-2.6[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-77[${PYTHON_USEDEP}]
	>=dev-python/versioneer-0.29[${PYTHON_USEDEP}]
"
