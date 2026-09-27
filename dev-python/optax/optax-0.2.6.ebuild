# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..13} )
DISTUTILS_USE_PEP517=flit

inherit distutils-r1 pypi

DESCRIPTION="Gradient processing and optimization for JAX"
HOMEPAGE="https://github.com/google-deepmind/optax"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/absl-py-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/chex-0.1.87[${PYTHON_USEDEP}]
	>=dev-python/jax-0.5.3[${PYTHON_USEDEP}]
	>=dev-python/jaxlib-0.5.3[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.18[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
