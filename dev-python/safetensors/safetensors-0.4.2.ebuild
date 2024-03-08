# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION=""
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
HOMEPAGE=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

IUSE="numpy torch tensorflow pinned-tf jax mlx paddlepaddle quality"
RDEPEND="numpy? ( >=dev-python/numpy-1.21.6[${PYTHON_USEDEP}] )
	torch? ( dev-python/safetensors[${PYTHON_USEDEP}]
		>=sci-libs/pytorch-1.10[${PYTHON_USEDEP}] )
	tensorflow? ( dev-python/safetensors[${PYTHON_USEDEP}]
		>=sci-libs/tensorflow-2.11.0[${PYTHON_USEDEP}] )
	pinned-tf? ( dev-python/safetensors[${PYTHON_USEDEP}]
		>=sci-libs/tensorflow-2.11.0[${PYTHON_USEDEP}] )
	jax? ( dev-python/safetensors[${PYTHON_USEDEP}]
		>=dev-python/flax-0.6.3[${PYTHON_USEDEP}]
		>=dev-python/jax-0.3.25[${PYTHON_USEDEP}]
		>=dev-python/jaxlib-0.3.25[${PYTHON_USEDEP}] )
	mlx? ( >=dev-python/mlx-0.0.9[${PYTHON_USEDEP}] )
	paddlepaddle? ( dev-python/safetensors[${PYTHON_USEDEP}]
		>=dev-python/paddlepaddle-2.4.1[${PYTHON_USEDEP}] )
	quality? ( >=dev-python/black-22.3[${PYTHON_USEDEP}]
		>=dev-python/click-8.0.4[${PYTHON_USEDEP}]
		>=dev-python/isort-5.5.4[${PYTHON_USEDEP}]
		>=dev-python/flake8-3.8.3[${PYTHON_USEDEP}] )"
distutils_enable_tests pytest
