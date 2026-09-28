# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit-core
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

DESCRIPTION="Model export tools for JAX"
HOMEPAGE="https://github.com/google/orbax"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/absl-py[${PYTHON_USEDEP}]
	dev-python/dataclasses-json[${PYTHON_USEDEP}]
	dev-python/etils[${PYTHON_USEDEP}]
	~dev-python/jax-0.9.2[rocm,${PYTHON_USEDEP}]
	~dev-python/jaxlib-0.9.2[${PYTHON_USEDEP}]
	dev-python/jaxtyping[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/protobuf[${PYTHON_USEDEP}]
	>=dev-python/orbax-checkpoint-0.9.0[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/flit-core-3.5[${PYTHON_USEDEP}]
	<dev-python/flit-core-4[${PYTHON_USEDEP}]
"
