# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

DESCRIPTION="Linear solvers in JAX and Equinox"
HOMEPAGE="https://github.com/google/lineax"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/equinox-0.11.10[${PYTHON_USEDEP}]
	~dev-python/jax-0.9.2[rocm,${PYTHON_USEDEP}]
	>=dev-python/jaxtyping-0.2.24[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.5.0[${PYTHON_USEDEP}]
"
